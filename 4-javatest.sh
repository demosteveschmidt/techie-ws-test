#!/bin/bash

DOCKER_USERNAME=demosteveschmidt
kubectl create deployment petclinic --image=${DOCKER_USERNAME}/petclinic
kubectl expose deployment/petclinic --port 8080 --type LoadBalancer
minikube service petclinic
