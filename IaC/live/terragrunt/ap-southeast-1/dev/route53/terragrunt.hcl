# # Including root configuration
# # Automatically find the root terragrunt.hcl and inherit configuration
# include {
#   path = find_in_parent_folders()
# }

# # Defining dependency on EKS
# dependency "eks" {
#   config_path = "../eks"
# }

# # Defining module source and inputs
# terraform {
#   # source = "git@github-win:OnlyLight/dev-terraform-module.git//eks?ref=v0.0.1"
#   source = "../../../../../modules/route53"
# }

# inputs = {
#   record_ips = dependency.eks.outputs.cluster_endpoint
# }
