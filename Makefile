KIND_CLUSTER_NAME := crossplane-cluster
NAMESPACE := crossplane-system

.PHONY: cluster create-kind delete-kind crossplane install-crossplane clean

# Step 1: Create Kind cluster
create-kind:
	@echo "Creating a Kind cluster"
	kind create cluster --name $(KIND_CLUSTER_NAME) --config kind-config.yaml

# Step 2: Delete Kind cluster
delete-kind:
	@echo "Deleting the Kind cluster"
	kind delete cluster --name $(KIND_CLUSTER_NAME)

# Step 3: Install Crossplane
install-crossplane:
	@echo "Running the Crossplane installation script"
	bash bootstrap.sh

setup: create-kind install-crossplane

# Step 4: Clean up
clean: delete-kind
	@echo "Cluster deleted!"
