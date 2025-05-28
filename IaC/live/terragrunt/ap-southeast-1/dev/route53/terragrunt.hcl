# Including root configuration
# Automatically find the root terragrunt.hcl and inherit configuration
include {
  path = find_in_parent_folders()
}

dependency "ingress_nginx" {
  config_path = "../ingress-nginx"

  mock_outputs = {
    helm_release_name = "helm_release_name"
  }
}

dependencies {
  paths = ["../ingress-nginx", "../eks"]
}

# Defining module source and inputs
terraform {
  source = "../../../../../modules/route53"
}

inputs = {
  ingress_release_name = dependency.ingress_nginx.outputs.helm_release_name
}
