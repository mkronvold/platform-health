# Check expiry
kubectl get certificates -A

# Force renewal (if using cert-manager)
cmctl renew <certificate-name> -n <namespace>
