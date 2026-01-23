# 1. Delete namespace (if it exists)
kubectl delete namespace production

# 2. Restore from Velero backup
velero restore create --from-backup manual-backup-20250125

# 3. Monitor restore
velero restore get
velero restore describe <restore-name>

# 4. Verify pods are running
kubectl get pods -n production
