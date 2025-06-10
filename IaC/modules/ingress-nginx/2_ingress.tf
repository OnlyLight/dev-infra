# Configure Helm provider
provider "helm" {
  kubernetes {
    host                   = var.eks_endpoint
    cluster_ca_certificate = try(base64decode(var.eks_ca_certificate), null)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", var.eks_cluster_name, "--region", var.region]
    }
  }
}

locals {
  ingress_name = "ingress-nginx"
}

# Deploy ingress-nginx Helm chart
resource "helm_release" "nginx_ingress" {
  count            = try(base64decode(var.eks_ca_certificate), null) == null ? 0 : 1
  name             = local.ingress_name
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = local.ingress_name
  namespace        = local.ingress_name
  create_namespace = true

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
    # create for the Ingress Controller’s Service
    # tells the AWS Cloud Controller Manager to provision a Network Load Balancer (NLB)
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-scheme"
    value = "internet-facing"
    # configures the NLB to have a public IP address, making it accessible from the internet.
  }

  # set {
  #   name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-name"
  #   value = "${local.ingress_name}-nlb"
  #   # sets the name of the NLB created by AWS
  # }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-additional-resource-tags"
    value = "Name=${local.ingress_name}-nlb,Environment=${var.env}"
  }

  depends_on = [var.eks_cluster_name]
}
