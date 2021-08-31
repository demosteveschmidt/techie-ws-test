#!/bin/bash

RELEASE="0.3.0"

minikube delete -p cnb && sleep 10
minikube start -p cnb && sleep 10 && minikube profile cnb

curl -LO https://github.com/pivotal/kpack/releases/download/v${RELEASE}/release-${RELEASE}.yaml

kubectl apply -f release-${RELEASE}.yaml

eval $(minikube docker-env)

DOCKER_USERNAME='demosteveschmidt'
DOCKER_PASSWORD='Damn#secure2'
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

kubectl apply -f dockerhub-registry-credentials.yaml

kubectl apply -f dockerhub-service-account.yaml

kubectl apply -f store.yaml

kubectl apply -f stack.yaml

kubectl apply -f builder.yaml

curl -s -S "https://registry.hub.docker.com/v2/repositories/${DOCKER_USERNAME}/" | jq .

kubectl apply -f dockerhub-image-node.yaml

