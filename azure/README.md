# Crossplane on Azure

## Prerequisites

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

```bash
az login

az ad sp create-for-rbac \
--sdk-auth \
--role Owner \
--scopes /subscriptions/

kubectl create secret \
generic azure-secret \
-n crossplane-system \
--from-file=creds=./azure-credentials.json

kubectl describe secret azure-secret -n crossplane-system

kubectl apply -f az-prov-config.yaml

kubectl apply -f vnet.yaml
kubectl get virtualnetwork.network

kubectl delete virtualnetwork.network crossplane-quickstart-network

```
