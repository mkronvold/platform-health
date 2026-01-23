# 1. Port-forward to Conjur
kubectl port-forward -n conjur svc/conjur-oss 8080:80

# 2. Login
conjur login -i admin

# 3. Update secret
conjur variable set -i k8s-secrets/database/password \
  -v "$(openssl rand -base64 32)"

# 4. ExternalSecret will auto-sync within refreshInterval

# 5. Restart pods to pick up new secret
kubectl rollout restart deployment/my-app -n production
