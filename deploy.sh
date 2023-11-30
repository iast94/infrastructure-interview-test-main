#!/bin/bash

# Install nginx controller
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

# Deploy the application YAML manifests
helm install app ./kube-news/

