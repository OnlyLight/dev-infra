# Infra resource for DevGuild-DevOps basic

# Note
## Diagram architecture 
[https://drive.google.com/file/d/1n5QHiFhACU3Wax24ZT1iMVsEP-xf6tiP/view?usp=sharing](https://drive.google.com/file/d/1c5ys37MESNOSXyDQNWLYuU3Ui3FY_AjS/view?usp=sharing)

# 1. Deploy EKS
```
cd IaC/live/terragrunt/ap-southeast-1/dev
terragrunt run-all init
terragrunt run-all apply
<!-- IaC/kubeconfig.yaml -->
terragrunt output kubeconfig > ../../../../kubeconfig.yaml
```

# 2. Verify Kubeconfig:
Test cluster with kubectl
```
export KUBECONFIG=$(pwd)/kubeconfig.yaml
kubectl get nodes
```

# 3. Run playbook:
```
cd ansible
ansible-playbook -i inventory/dev.yaml playbooks/deploy-manifests.yaml
```

# 4. Verify deployment:
```
kubectl get pods
```

# 5. Clean up ansible:
```
cd ansible
ansible-playbook -i inventory/dev.yaml playbooks/deploy-manifests.yaml --extra-vars "state=absent"

cd IaC
cd IaC/live/terragrunt/ap-southeast-1/dev
terragrunt run-all destroy
```

- try to run ansible on k8s local -- V
- setup full flow configuration with ansible (application, logging, monitoring, tracing, argocd)
  - data_store -- V
  - scrape_data -- V
  - application (api, web)
  - logging
  - metrics
  - tracing
  - argocd
- run terragrunt => provision Infrastruct => test infra
- apply ansible on aws infra
