echo 1. Remove old container images
talosctl -n 192.168.1.201,192.168.1.202 service containerd --action=cleanup

echo 2. Clean up unused PVs
kubectl get pv | grep Released

echo 3. Remove old completed jobs
kubectl delete jobs --field-selector status.successful=1 -A

echo 4. Clean up old pods
kubectl delete pods --field-selector status.phase=Succeeded -A
kubectl delete pods --field-selector status.phase=Failed -A

echo 5. Review and remove unused secrets/configmaps
kubectl get secrets -A --sort-by='.metadata.creationTimestamp'
kubectl get configmaps -A --sort-by='.metadata.creationTimestamp'

echo 6. Clean old Velero backups (older than 30 days)
velero backup delete --confirm --selector 'created-before=30d'
