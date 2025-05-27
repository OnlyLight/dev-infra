resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = {
    Environment = var.env
  }
}

resource "aws_route53domains_registered_domain" "example" {
  domain_name = aws_route53_zone.main.name

  dynamic "name_server" {
    for_each = aws_route53_zone.main.name_servers
    content {
      name = name_server.value
    }
  }
}
