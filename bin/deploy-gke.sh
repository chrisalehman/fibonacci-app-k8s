#!/bin/bash

# build docker images
docker build -t chrisalehman/fibonacci-app-k8s-client:latest -t chrisalehman/fibonacci-app-k8s-client:${GIT_SHA} -f ./client/Dockerfile ./client
docker build -t chrisalehman/fibonacci-app-k8s-server:latest -t chrisalehman/fibonacci-app-k8s-server:${GIT_SHA} -f ./server/Dockerfile ./server
docker build -t chrisalehman/fibonacci-app-k8s-worker:latest -t chrisalehman/fibonacci-app-k8s-worker:${GIT_SHA} -f ./worker/Dockerfile ./worker

# push to docker hub
docker push chrisalehman/fibonacci-app-k8s-client:latest
docker push chrisalehman/fibonacci-app-k8s-server:latest
docker push chrisalehman/fibonacci-app-k8s-worker:latest
docker push chrisalehman/fibonacci-app-k8s-client:${GIT_SHA}
docker push chrisalehman/fibonacci-app-k8s-server:${GIT_SHA}
docker push chrisalehman/fibonacci-app-k8s-worker:${GIT_SHA}

# apply config files to kubernetes cluster
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=chrisalehman/fibonacci-app-k8s-client:${GIT_SHA}
kubectl set image deployments/server-deployment server=chrisalehman/fibonacci-app-k8s-server:${GIT_SHA}
kubectl set image deployments/worker-deployment worker=chrisalehman/fibonacci-app-k8s-worker:${GIT_SHA}
