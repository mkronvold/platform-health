# 1. Check for image vulnerabilities
kubectl get vulnerabilityreports -A

# 2. Review Trivy operator findings
kubectl get configauditreports -A

# 3. Check for failed authentication attempts
talosctl logs apid -n 192.168.1.201 | grep -i "authentication failed"

# 4. Review Conjur audit logs
kubectl logs -n conjur -l app=conjur-oss --tail=100 | grep -i audit

# 5. Check network policies are active
kubectl get networkpolicies -A
