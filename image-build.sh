#!/bin/bash

# Build the Docker image locally
docker build -t <username>/<image-name>:v1 .

# Push the Docker image to DockerHub
docker push <username>/<image-name>:v1
