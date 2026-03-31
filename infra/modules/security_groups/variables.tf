variable "sg_cidr" {
    type = string
    description = "ipv4 Cidr block for alb sg"
}

variable "http_port" {
    type = number
    description = "http port for the alb sg"
}

variable "https_port" {
    type = number
    description = "https port for the alb sg"
}

variable "vpc_id" {
    type = string
    description = "Id of the vpc"
}

variable "container_port" {
    type = number
    description = "container port"
}
