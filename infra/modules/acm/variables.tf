variable "ecs_subdomain" {
    type = string
    description = "Name of the subdomain"
}

variable "validation_method" {
    type = string
    description = "validation method for the certificate"
}

variable "hosted_zone_domain" {
    type = string
    description = "Name of the hosted zone domain name"
}