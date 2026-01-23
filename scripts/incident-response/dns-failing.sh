# Test DNS
kubectl run -it --rm debug --image=busybox --restart=Never -- \
  nslookup kubernetes.default

# Check CoreDNS
kubectl logs -n kube-system -l k8s-app=kube-dns

# Restart CoreDNS
kubectl rollout restart deployment/coredns -n kube-system
