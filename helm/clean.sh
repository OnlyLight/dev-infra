#/bin/bash

# helm uninstall api website

helm uninstall \
  consumer \
  crawler \
  migrate \
  migrate-init \
  postgres redis

helm uninstall nginx-ingress -n ingress-nginx
kubectl delete -f storageclass.yaml
