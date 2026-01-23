# 1. List all cluster roles
kubectl get clusterroles

# 2. Check who can perform dangerous operations
kubectl auth can-i --list --as=system:serviceaccount:default:default

# 3. Review role bindings
kubectl get rolebindings -A
kubectl get clusterrolebindings

# 4. Check for overly permissive roles
kubectl get clusterroles -o json | \
  jq '.items[] | select(.rules[].verbs[] | contains("*"))'
