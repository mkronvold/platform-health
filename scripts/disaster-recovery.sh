echo For complete cluster loss
# 1. Rebuild cluster from Talos configs
# Follow TALOS_KUBERNETES_SETUP.md steps 1-4

# 2. Reinstall Velero
helm install velero vmware-tanzu/velero \
  --namespace velero \
  --create-namespace \
  --values k8s/infrastructure/velero/values.yaml

# 3. Restore all namespaces
velero restore create full-cluster-restore \
  --from-backup <latest-backup-name>

# 4. Verify
kubectl get pods -A
