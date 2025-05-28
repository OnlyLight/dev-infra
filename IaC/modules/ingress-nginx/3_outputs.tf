# Outputs
output "helm_release_name" {
  value = length(helm_release.nginx_ingress) > 0 ? helm_release.nginx_ingress[0].name : null
}
