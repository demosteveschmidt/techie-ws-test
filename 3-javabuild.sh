#!/bin/bash

kubectl apply -f store-full.yaml

kubectl apply -f builder-full.yaml

kubectl apply -f dockerhub-image.yaml
