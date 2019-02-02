# fibonacci-app-k8s
Multi-container Docker application developed as part of "Docker and Kubernetes: The Complete Guide" Udemy course. Deployable to Google Kubernetes Engine (GKE). 

Underlying stack based on React, Express, Redis and PostgreSQL. TravisCI builds and pushes Docker images to Docker Hub, then deploys application to Google Kubernetes Engine (GKE).

Prerequisites in Google Cloud:
1. Encrypt Travid CI GCP credentials
2. Encrypt PostgreSQL credentials
3. Install helm + tiller for simplifying package installation on kubernetes (like yum/brew/apt)
4. Install ingress controller using helm/tiller
5. Purchase and configure domain
6. Create and install SSL certificate
