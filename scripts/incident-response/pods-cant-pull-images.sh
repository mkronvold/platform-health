# Check image pull secrets
kubectl get secrets
kubectl describe pod <pod-name> | grep -A5 "Events:"

# Fix: Create image pull secret
kubectl create secret docker-registry regcred \
  --docker-server=registry.example.com \
  --docker-username=user \
  --docker-password=password
