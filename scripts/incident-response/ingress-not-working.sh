# Check ingress resource
kubectl get ingress -A
kubectl describe ingress <name> -n <namespace>

# Check Cilium ingress controller
kubectl logs -n kube-system -l app.kubernetes.io/name=cilium

# Verify LoadBalancer IP assigned
kubectl get svc -n kube-system | grep cilium-ingress
