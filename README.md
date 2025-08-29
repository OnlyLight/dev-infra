# Infra resource for DevGuild-DevOps basic

# Note
## Diagram architecture 
[https://drive.google.com/file/d/1n5QHiFhACU3Wax24ZT1iMVsEP-xf6tiP/view?usp=sharing](https://drive.google.com/file/d/1c5ys37MESNOSXyDQNWLYuU3Ui3FY_AjS/view?usp=sharing)

# 1. Deploy EKS
```
cd IaC/live/terragrunt/ap-southeast-1/dev
terragrunt run-all init
terragrunt run-all plan --terragrunt-exclude-dir ./ingress-nginx/ --terragrunt-exclude-dir ./route53/
terragrunt run-all apply
<!-- IaC/kubeconfig.yaml -->
cd eks/
terragrunt output kubeconfig > ../../../../../../kubeconfig.yaml

<!-- connect to EKS -->
aws eks --region ap-southeast-1 update-kubeconfig --name dev-eks-t
```

# 2. Verify Kubeconfig:
Test cluster with kubectl
```
export KUBECONFIG=$(pwd)/kubeconfig.yaml
kubectl get nodes
```

For WSL on Windows:
```
<!-- Only run if it is not exist folder ~/.kube/ -->
mkdir ~/.kube/

<!-- if existing folder ~/.kube/config -->
rm -f ~/.kube/config
cp /mnt/c/Users/duyquangtran/.kube/config ~/.kube/config

```

# 3. Run playbook:
```
cd ansible
ansible-playbook -i inventory/eks.yaml playbooks/eks-manifests.yaml --extra-vars "env=dev"
```

# 4. Verify deployment:
```
kubectl get pods
```

# 5. Clean up:
```
cd ansible
ansible-playbook -i inventory/eks.yaml playbooks/eks-manifests.yaml --extra-vars "state=absent" --extra-vars "env=dev"

cd IaC
cd IaC/live/terragrunt/ap-southeast-1/dev
terragrunt run-all destroy
```

- try to run ansible on k8s local -- V
- setup full flow configuration with ansible (application, logging, monitoring, tracing, argocd)
  - data_store -- V
  - scrape_data -- V
  - ingress-nginx, argocd (step isolate) -- V
  - application (api, web) -- V
  - logging -- V
  - metrics -- V
  - tracing -- V
  - try to integrate ingress-nginx and argocd in ansible -- V
- run terragrunt => provision Infrastruct => test infra -- V
- apply ansible on aws infra -- V
- apply CI auto create Infra and Config by dagger

NOTE:
eksctl create iamserviceaccount \
    --name <service-account-name> \
    --namespace <namespace> \
    --cluster <cluster-name> \
    --attach-policy-arn arn:aws:iam::<account-id>:policy/<policy-name> \
    --approve
