#!/bin/bash

## Functional Tests:
echo $'\n'"----------------------------------------"
echo "Functional Tests:"
# Testing if application is running
echo "To verify if the application is running, do the following:"$'\n'"If you are applying the test for the first time, check if an empty list appears in the next line, otherwise it will appear: [{"id":1,"title":"","text":""}]"
curl http://$(kubectl get ingress | grep ingress | awk -F " " '{print $4}')/posts
echo $'\n'

# Testing POST
curl -s -f -d '{"id": "1"}' -H "Content-Type: application/json" -X POST http://$(kubectl get ingress | grep ingress | awk -F " " '{print $4}')/posts


# Testing if the database is storing data
echo "If the database is storing data correctly you should see the following data on the next line: [{"id":1,"title":"","text":""}]  "
curl http://$(kubectl get ingress | grep ingress | awk -F " " '{print $4}')/posts
echo $'\n'"----------------------------------------"

## Performance Tests:
echo $'\n'"Performance Tests:"
# Run this command to create the metrics-server:
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/high-availability.yaml

# Variables
NUM_PODS=4  # Number of pods, including the database, in your Kubernetes deployment
CONCURRENT_USERS=(100 500 1000)  # List of concurrent users to test
TEST_DURATION=10  # Duration of each test in seconds
REQUESTS=10 # Define the number of requests per user

# Function to run ApacheBench tests
run_ab_tests() {
    local concurrent_users=$1
    echo "Running ApacheBench test with $concurrent_users concurrent users for $TEST_DURATION seconds"
    ab -n $((concurrent_users * REQUESTS)) -c $concurrent_users -t $TEST_DURATION http://$(kubectl get ingress | grep ingress | awk -F " " '{print $4}')/posts
}

# Function to measure resource utilization
measure_resource_utilization() {
    local pod_name=$1
    echo "Measuring resource utilization for pod: $pod_name"
    kubectl top pod $pod_name
    
}

# Loop through each concurrent user load
for users in "${CONCURRENT_USERS[@]}"; do
    # Run ApacheBench test
    run_ab_tests $users

    # Get pod names for the application's replicas
    pod_names=($(kubectl get pods | grep app | awk '{print $1}' | head -n $NUM_PODS))

    # Measure resource utilization for each pod replica
    for pod in "${pod_names[@]}"; do
        measure_resource_utilization $pod
    done

    echo "----------------------------------------"
done