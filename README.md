# Crossplane on K8s (Kind)

This local lab provides a fully automated way to set up a local Kubernetes cluster using Kind and install Crossplane via Helm.

## Prerequisites

Ensure you have the following installed on your system:

- **Docker Desktop**: Required for running Kind clusters.
- **Kind**: Version 0.11.1 or later.
- **Helm**: Version 3.2.0 or later.

To install these tools:

```bash
brew install kind helm
```

## Usage

```bash
make create-kind
make install-crossplane

## Customize Crossplane

helm upgrade crossplane --namespace crossplane-system --reuse-values --values values.yaml crossplane-stable/crossplane

## Verify Crossplane
kubectl get pods -n crossplane-system

make clean
```

## Extras

- [Crossplane Helm Chart](https://github.com/crossplane/crossplane/tree/master/cluster/charts/crossplane)
- [Upbound](https://upbound.io/): For additional features and tools, check out Upbound's Universal Crossplane.
