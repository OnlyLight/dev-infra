#/bin/bash

kubectl apply -f storageclass.yaml

cd application/
helm install postgres postgres/
helm install redis redis/

cd scrape_data/
helm install crawler crawler/
helm install migrate-init migrate-init/
helm install migrate migrate/
helm install consumer consumer/

helm install nginx-ingress ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
