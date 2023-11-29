#!/bin/bash

# Build the Docker image locally
docker build -t app:latest .

# Push the Docker image to DockerHub
docker push app:latest