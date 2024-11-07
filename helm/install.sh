#/bin/bash

# kubectl apply -f storageclass.yaml

# kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.16.1/cert-manager.yaml
# # kubectl apply -f issuer.yaml
# # kubectl apply -f issuer.yaml -n argocd

cd application/
helm install postgres postgres/
helm install redis redis/

cd scrape_data/
helm install crawler crawler/
helm install migrate-init migrate-init/
helm install migrate migrate/
helm install consumer consumer/

# kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace
