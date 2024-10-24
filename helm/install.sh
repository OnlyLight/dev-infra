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

cd ../api/
helm install api api/
helm install website website/
