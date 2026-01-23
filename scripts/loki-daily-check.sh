# Port-forward to Grafana
kubectl port-forward -n monitoring svc/kube-prometheus-stack-grafana 3000:80

cat << EONOTES
Open browser to http://localhost:3000
 Navigate to Explore → Loki
 Query: {namespace="production"} |= "error"

Access Grafana and review
 Kubernetes/Compute Resources/Cluster: Overall cluster health
 Talos Dashboard: Node-specific metrics
 Cilium Metrics: Network performance
 Alerts: Any firing alerts
EONOTES
