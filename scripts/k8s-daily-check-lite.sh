#!/bin/bash
# Daily cluster health check script

echo "=== Cluster Health Check ==="
date

# 1. Check node status
echo -e "\n1. Node Status:"
kubectl get nodes -o wide

# 2. Check system pods
echo -e "\n2. System Pods Status:"
kubectl get pods -n kube-system --field-selector=status.phase!=Running
kubectl get pods -n monitoring --field-selector=status.phase!=Running
kubectl get pods -n logging --field-selector=status.phase!=Running

# 3. Check recent events
echo -e "\n3. Recent Cluster Events:"
kubectl get events --all-namespaces --sort-by='.lastTimestamp' | tail -20

# 4. Check disk usage on nodes
echo -e "\n4. Disk Usage:"
talosctl -n 192.168.1.201,192.168.1.202 df | grep -E "FILESYSTEM|/dev/nvme"

# 5. Check for pending PVCs
echo -e "\n5. Pending PVCs:"
kubectl get pvc -A | grep Pending

# 6. Check certificate expiry
echo -e "\n6. Certificate Expiry:"
kubectl get certificates -A

echo -e "\n=== Health Check Complete ==="
