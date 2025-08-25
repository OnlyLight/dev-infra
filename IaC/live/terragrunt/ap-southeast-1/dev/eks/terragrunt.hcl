# Including root configuration
# Automatically find the root terragrunt.hcl and inherit configuration
include {
  path = find_in_parent_folders()
}

# Defining dependency on VPC
dependency "vpc" {
  config_path = "../vpc"

  # For those who are still suffering about this issue, you may also try adding a mock_outputs to the dependency
  mock_outputs = {
    private_zone1_id = "private_zone2_id"
    private_zone2_id = "private_zone2_id"
  }
}

# Defining module source and inputs
terraform {
  # source = "git@github-win:OnlyLight/dev-terraform-module.git//eks?ref=v0.0.1"
  source = "../../../../../modules/eks"
}

inputs = {
  account_id       = ""
  private_zone1_id = dependency.vpc.outputs.private_zone1_id
  private_zone2_id = dependency.vpc.outputs.private_zone2_id
}