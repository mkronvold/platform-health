# 1. Check PVC status
kubectl get pvc -A

# 2. Check NFS connectivity
kubectl run -it --rm debug --image=busybox --restart=Never -- \
  ping 192.168.1.100

# 3. Check NFS provisioner
kubectl logs -n kube-system -l app=nfs-subdir-external-provisioner

# 4. Test NFS mount manually
talosctl -n 192.168.1.201 read /proc/mounts | grep nfs
