#!/bin/bash

# Wait for application to be ready
kubectl rollout status deployment/web-web

# Testing if application is running
curl http://$(kubectl get ingress | grep ingress | awk -F " " '{print $4}')/posts

# Run other functional tests using curl or other tools for scenarios mentioned
curl -d '{"id": "1"}' -H "Content-Type: application/json" -X POST http://$(kubectl get ingress | grep ingress | awk -F " " '{print $4}')/posts

# Install the apache2-utils package
apt-get update
apt-get install apache2-utils

# Using Apache Bench for load testing
ab -n 1000 -c 100 http://$(kubectl get ingress | grep ingress | awk -F " " '{print $4}')/posts