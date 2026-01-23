# 1. Identify crashing pod
kubectl get pods -A | grep -E 'CrashLoopBackOff|Error'

# 2. Check logs
kubectl logs <pod-name> -n <namespace> --previous

# 3. Describe pod for events
kubectl describe pod <pod-name> -n <namespace>

# 4. Common fixes:
# - Resource limits too low → Increase
# - Missing config → Check ConfigMap/Secret
# - Application bug → Check logs, fix code
# - Liveness probe failing → Adjust probe settings
