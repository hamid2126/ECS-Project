variable "alb_sg_id" {
    type = string
    description = "Id of the alb sg"
}

variable "public_subnet1_id" {
    type = string
    description = "Id of the 1st public subnet"
}

variable "public_subnet2_id" {
    type = string
    description = "Id of the 2nd public subnet"
}

variable "container_port" {
    type = number
    description = "Port number of the container"
}

variable "vpc_id" {
    type = string
    description = "Id of the vpc"
}

variable "certificate_arn" {
    type = string
    description = "Arn of the certificate"
}

variable "ssl_policy" {
    type = string
    description = "SSL policy for the https listener"
}