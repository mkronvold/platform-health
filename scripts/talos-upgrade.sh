# 1. Check current version
talosctl version -n 192.168.1.201,192.168.1.202

# 2. Review release notes
# https://github.com/siderolabs/talos/releases/tag/v1.6.5

# 3. Upgrade worker first (test)
talosctl upgrade -n 192.168.1.202 \
  --image ghcr.io/siderolabs/installer:v1.6.5 \
  --preserve

# Wait and verify
kubectl get nodes -w

# 4. Upgrade control plane
talosctl upgrade -n 192.168.1.201 \
  --image ghcr.io/siderolabs/installer:v1.6.5 \
  --preserve

# 5. Verify cluster health
talosctl health -n 192.168.1.201,192.168.1.202
kubectl get nodes
