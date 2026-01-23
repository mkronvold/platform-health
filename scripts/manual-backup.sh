# 1. Trigger Velero backup
velero backup create manual-backup-$(date +%Y%m%d) \
  --include-namespaces production,staging \
  --wait

# 2. Check backup status
velero backup describe manual-backup-$(date +%Y%m%d)

# 3. Backup Talos configuration
cd /path/to/synology_containers/talos
tar czf talos-config-backup-$(date +%Y%m%d).tar.gz \
  controlplane.yaml worker.yaml talosconfig kubeconfig

# Encrypt and store securely
gpg -c talos-config-backup-$(date +%Y%m%d).tar.gz
mv talos-config-backup-$(date +%Y%m%d).tar.gz.gpg /secure/location/

# 4. Backup etcd (Talos does this automatically, but manual option)
talosctl etcd snapshot -n 192.168.1.201 \
  > etcd-snapshot-$(date +%Y%m%d).db

scp etcd-snapshot-$(date +%Y%m%d).db \
  admin@192.168.1.100:/volume1/k8s-backups/etcd/
