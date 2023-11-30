#!/bin/bash

# Start K3d Kubernetes cluster
k3d cluster create mycluster

# Create a remote environment
terraform -chdir=./terraform/ init 
terraform -chdir=./terraform/ plan 
terraform -chdir=./terraform/ apply -auto-approve
