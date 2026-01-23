echo  1. Node resource usage trends
kubectl top nodes

echo  2. Pod resource usage
kubectl top pods -A --sort-by=memory | head -20
kubectl top pods -A --sort-by=cpu | head -20

echo  3. Storage usage
kubectl get pvc -A -o custom-columns=\
"NAMESPACE:.metadata.namespace,\
NAME:.metadata.name,\
SIZE:.spec.resources.requests.storage,\
USED:.status.capacity.storage"

echo  4. Check Prometheus for trends
echo     Query in Grafana:
echo     node_filesystem_avail_bytes{mountpoint="/var/lib/kubelet"}
echo     container_memory_working_set_bytes



cat << EONOTES
#When to Add Resources

##Add Memory when:
- Node memory consistently > 75%
- Frequent OOMKilled pods
- Swap usage increasing (if enabled)

##Add CPU when:
- Node CPU consistently > 70%
- Pods throttled frequently
- High latency in applications

##Add Storage when:
- PVC usage > 70%
- Prometheus retention needs > 30 days
- Log volume increasing

##Add Nodes when:
- Can't schedule new pods (Pending)
- Need better HA (3+ control planes)
- Want dedicated nodes for workload types

EONOTES
