#!/bin/bash

KIND_CLUSTER_NAME="crossplane-cluster"
NAMESPACE="crossplane-system"
HELM_REPO="https://charts.crossplane.io/stable"

# Step 1: Create Kind cluster
create_kind_cluster() {
    echo "Creating Kind cluster with config file"
    kind create cluster --name $KIND_CLUSTER_NAME --config kind-config.yaml
}

# Step 2: Add Crossplane Helm repo and install Crossplane
install_crossplane() {
    echo "Adding Crossplane Helm repository"
    helm repo add crossplane-stable $HELM_REPO
    helm repo update

    echo "Installing Crossplane Helm chart"
    helm install crossplane --namespace $NAMESPACE --create-namespace crossplane-stable/crossplane
}

# Step 3: Wait for Crossplane to be ready
wait_for_crossplane() {
    echo "Waiting for Crossplane components to be ready..."
    kubectl wait --for=condition=available --timeout=600s deployment -l app=crossplane -n $NAMESPACE
}

# Execute steps
create_kind_cluster
install_crossplane
wait_for_crossplane

echo "Crossplane installation complete."
