#!/bin/bash

DOCKER_USERNAME=demosteveschmidt

kubectl apply -f stack-latest.yaml

sleep 60

kubectl apply -f dockerhub-image-main.yaml

