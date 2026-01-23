# Update repos
helm repo update

# List outdated charts
helm list -A

# Upgrade charts one by one (test in staging first!)
helm upgrade prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --values k8s/infrastructure/monitoring/values.yaml

# Monitor the upgrade
kubectl rollout status statefulset/prometheus-kube-prometheus-stack-prometheus -n monitoring
