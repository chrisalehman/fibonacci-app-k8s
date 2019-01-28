#!/bin/bash

###
# reference script for all manual commands required to set up this project
###

#######
# DEV #
#######

# 1. encrypt secret for accessing postgres within k8s
#
# kubectl create secret generic pgpassword --from-literal PGPASSWORD=<PASSWORD>
#   a) configure the server in server-deployment.yaml to use it
#   b) configure the worker in server-deployment.yaml to use it

# 2. create local ingress controller for use on minikube
#
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
# minikube addons enable ingress
#   a) command 'minikube ip' will provide IP for accessing resources within minikube
#   b) configure ingress-service configuration file

########
# PROD #
########

# 1. ecrypt credentials for accessing google cloud from travis using github repo specified by -r
#
#   a) set up service account in GCP
#   b) download credentials .json file
#   c) move to local dir and rename to 'service-account.json'
# travis encrypt-file service-account.json -r chrisalehman/fibonacci-app-k8s --add 

# 2. encrypt secret for accessing postgres within k8s on GKE
#
#   a) open google cloud shell
#   b) invoke gcloud config steps from .travis file re: project, geo/zone, get-credentials
# kubectl create secret generic pgpassword --from-literal PGPASSWORD=<PASSWORD>
#   a) configure the server in server-deployment.yaml to use it
#   b) configure the worker in server-deployment.yaml to use it

# 3. install helm + tiller for simplifying package installation on kubernetes (like yum/brew/apt)
#
#   a) open google cloud shell
#   b) invoke comamnds:
# curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
# chmod 700 get_helm.sh
# ./get_helm.sh 
# kubectl create serviceaccount --namespace kube-system tiller
# kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller 
# helm init --service-account tiller --upgrade

# 4. install ingress controller using helm/tiller
#
#   a) from google cloud shell
# helm install stable/nginx-ingress --name my-nginx --set rbac.create=true
