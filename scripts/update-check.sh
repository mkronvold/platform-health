# 1. Check for Talos updates
talosctl version --nodes 192.168.1.201,192.168.1.202

# Visit https://github.com/siderolabs/talos/releases for new versions

# 2. Check for Kubernetes updates
kubectl version

# 3. Check for Helm chart updates
helm repo update
helm list -A

# For each chart:
helm search repo <chart-name> --versions | head -5

# 4. Check for container image updates (Diun)
kubectl logs -n kube-system -l app=diun --tail=50
