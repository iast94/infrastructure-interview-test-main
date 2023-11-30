#!/bin/bash

# Build the Docker image locally
docker build -t <username>/app:latest .

# Push the Docker image to DockerHub
docker push <username>/app:latest