# 1. Check current version
cilium version

# 2. Update Helm repo
helm repo update

# 3. Review new version
helm search repo cilium/cilium --versions | head -5

# 4. Upgrade
helm upgrade cilium cilium/cilium \
  --namespace kube-system \
  --values k8s/bootstrap/cilium/values.yaml \
  --version 1.14.6

# 5. Verify connectivity
cilium connectivity test

# 6. Check network policies still work
kubectl get networkpolicies -A
