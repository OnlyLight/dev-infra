# Fetch NLB details
data "aws_lb" "ingress_nginx" {
  tags = {
    Name = "${var.ingress_release_name}-nlb"
    # Environment = var.env
  }
}

# # Resolve NLB IPs
# data "aws_lb_hosted_zone_id" "nlb" {
# }

# Creating A record for api.onlylight.click
resource "aws_route53_record" "api" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api.${var.domain_name}"
  type    = "A"
  alias {
    name                   = data.aws_lb.ingress_nginx.dns_name
    zone_id                = data.aws_lb.ingress_nginx.zone_id
    evaluate_target_health = true
  }
}

# Creating A record for website.onlylight.click
resource "aws_route53_record" "website" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "website.${var.domain_name}"
  type    = "A"
  alias {
    name                   = data.aws_lb.ingress_nginx.dns_name
    zone_id                = data.aws_lb.ingress_nginx.zone_id
    evaluate_target_health = true
  }
}

# Creating A record for kibana.onlylight.click
resource "aws_route53_record" "kibana" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "kibana.${var.domain_name}"
  type    = "A"
  alias {
    name                   = data.aws_lb.ingress_nginx.dns_name
    zone_id                = data.aws_lb.ingress_nginx.zone_id
    evaluate_target_health = true
  }
}

# Creating A record for grafana.onlylight.click
resource "aws_route53_record" "grafana" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "grafana.${var.domain_name}"
  type    = "A"
  alias {
    name                   = data.aws_lb.ingress_nginx.dns_name
    zone_id                = data.aws_lb.ingress_nginx.zone_id
    evaluate_target_health = true
  }
}

# Creating A record for argocd.onlylight.click
resource "aws_route53_record" "argocd" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "argocd.${var.domain_name}"
  type    = "A"
  alias {
    name                   = data.aws_lb.ingress_nginx.dns_name
    zone_id                = data.aws_lb.ingress_nginx.zone_id
    evaluate_target_health = true
  }
}
