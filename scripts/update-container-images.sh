# For deployments managed by ArgoCD, update Git repo
# For manual deployments:

kubectl set image deployment/my-app \
  my-app=myregistry/my-app:v2.0.0 \
  --record

kubectl rollout status deployment/my-app
