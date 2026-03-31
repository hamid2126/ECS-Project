output "hosted_zone_domain" {
    description = "Id of the hosted zone domain"
    value = data.aws_route53_zone.domain_hosted_zone.id
}