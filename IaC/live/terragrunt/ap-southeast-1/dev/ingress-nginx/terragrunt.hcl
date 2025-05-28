# Including root configuration
# Automatically find the root terragrunt.hcl and inherit configuration
include {
  path = find_in_parent_folders()
}

# Defining dependency on EKS
dependency "eks" {
  config_path = "../eks"

  # For those who are still suffering about this issue, you may also try adding a mock_outputs to the dependency
  mock_outputs = {
    cluster_name = "cluster_name"
    cluster_endpoint = "cluster_endpoint"
    cluster_ca_certificate = "cluster_ca_certificate"
  }
}

# Defining module source and inputs
terraform {
  # source = "git@github-win:OnlyLight/dev-terraform-module.git//eks?ref=v0.0.1"
  source = "../../../../../modules/ingress-nginx"
}

inputs = {
  eks_cluster_name = dependency.eks.outputs.cluster_name
  eks_endpoint = dependency.eks.outputs.cluster_endpoint
  eks_ca_certificate = dependency.eks.outputs.cluster_ca_certificate
}
