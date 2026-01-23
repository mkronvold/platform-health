# 1. Check current version
kubectl version --short

# 2. Upgrade to new version (e.g., 1.29.0 → 1.29.3)
talosctl upgrade-k8s -n 192.168.1.201 --to 1.29.3

# This will:
# - Upgrade control plane components
# - Upgrade kubelet on all nodes
# - Drain and upgrade nodes one by one
# - Zero downtime

# 3. Monitor progress
kubectl get nodes -w

# 4. Verify
kubectl version
kubectl get nodes
