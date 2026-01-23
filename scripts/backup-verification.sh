# 1. Check Velero backup status
velero backup get
velero backup describe $(velero backup get | tail -1 | awk '{ print $1 }')

# 2. Verify backups on Synology
#ssh admin@192.168.1.100 "ls -lh /volume1/k8s-backups/ | tail -10"

# 3. Test restore (optional, monthly)
# See Backup & Restore section

# 4. Verify etcd health
#talosctl etcd members -n 192.168.1.201
