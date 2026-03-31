data "aws_route53_zone" "domain_hosted_zone" {
  name         = var.hosted_zone_domain
  private_zone = false
}

resource "aws_route53_record" "ecs_subdomain" {
  zone_id = data.aws_route53_zone.domain_hosted_zone.id
  name    = var.ecs_subdomain
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}


