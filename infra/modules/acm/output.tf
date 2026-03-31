output "certificate_arn" {
  description = "arn of the certificate"
  value = aws_acm_certificate.cert.arn
}

output "hosted_zone_domain" {
    description = "Id of the hosted zone domain"
    value = data.aws_route53_zone.domain_hosted_zone.id
}

