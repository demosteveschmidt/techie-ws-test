#!/bin/bash

DOCKER_USERNAME=demosteveschmidt
kubectl create deployment cnb-hello-node --image=${DOCKER_USERNAME}/cnb-hello-node
kubectl expose deployment/cnb-hello-node --port 8080 --type LoadBalancer
minikube service cnb-hello-node
