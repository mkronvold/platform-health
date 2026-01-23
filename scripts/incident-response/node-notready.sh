# 1. Check node status
kubectl describe node <node-name>

# 2. Check Talos logs
talosctl logs -n <node-ip>

# 3. Check kubelet
talosctl logs kubelet -n <node-ip>

# 4. Common fixes:
# - Disk full → Clean up
# - Network issue → Check Cilium
# - Kubelet crash → Restart service
talosctl service kubelet restart -n <node-ip>
