#/bin/bash

helm uninstall api website

helm uninstall \
  consumer \
  crawler \
  migrate \
  migrate-init \
  postgres redis

helm uninstall nginx-ingress -n ingress-nginx
helm uninstall argocd -n argocd

kubectl delete -f https://github.com/cert-manager/cert-manager/releases/download/v1.16.1/cert-manager.yaml

kubectl delete -f storageclass.yaml
