# Crossplane on AWS

```bash
kubectl get pods -n crossplane-system
kubectl api-resources  | grep crossplane
```

```bash
kubectl create secret \
generic aws-secret \
-n crossplane-system \
--from-file=creds=./aws-credentials.txt

kubectl get secrets -n crossplane-system

kubectl apply -f prov-config.yaml

## Create S3 Bucket
kubectl apply -f s3-bucket.yaml

kubectl get buckets

kubectl delete bucket crossplane-bucket-hhdzh
```
