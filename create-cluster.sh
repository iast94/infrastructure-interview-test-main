#!/bin/bash

# Start K3d Kubernetes cluster
k3d cluster create mycluster

# Create a remote environment
terraform init 
terraform plan 
terraform apply -auto-approve
