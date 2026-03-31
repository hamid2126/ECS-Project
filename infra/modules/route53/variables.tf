variable "hosted_zone_domain" {
    type = string
    description = "Name of the hosted zone domain name"
}

variable "ecs_subdomain" {
    type = string
    description = "Name of the subdomain for the record"
}

variable "alb_dns_name" {
    type = string
    description = "DNS name of the alb"
}

variable "alb_zone_id" {
    type = string
    description = "Zone ID of the alb"
}