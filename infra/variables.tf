variable "vpc_cidr_block" { 
  type        = string
  description = "cidr block for vpc"
  }

variable "cidr_block_public1" {
  type = string
  description = "cidr block for 1st public subnet"
}

variable "cidr_block_public2" {
  type = string
  description = "cidr block for 2nd public subnet"
}

variable "cidr_block_private1" {
  type = string
  description = "cidr block for 1st private subnet"
}

variable "cidr_block_private2" {
  type = string
  description = "cidr block for 2nd private subnet"
}

variable "az_1" {
  type = string
  description = "1st availability zone"
}

variable "az_2" {
  type = string
  description = "2nd availability zone"
}

variable "route_table_cidr_block" {
  type = string
  description = "cidr block for the 2 route tables"
}

variable "attached_policy_arn" {
    type = string
    description = "policy ARN to attach to policy"
}

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

variable "container_port" {
    type = number
    description = "container port"
}

variable "hosted_zone_domain" {
    type = string
    description = "Name of the hosted zone domain name"
}

variable "ecs_subdomain" {
    type = string
    description = "Name of the subdomain for the record"
}

variable "validation_method" {
    type = string
    description = "validation method for the certificate"
}

variable "ssl_policy" {
    type = string
    description = "SSL policy for the https listener"
}

variable "task_family" {
    type = string
    description = "Task family name"
}

variable "network_mode" {
    type = string
    description = "Network mode name"
}

variable "container_name" {
    type = string
    description = "Name of the container"
}

variable "container_image" {
    type = string
    description = "URI of the container"
}

variable "cpu" {
    type = string
    description = "CPU of the container"
}

variable "memory" {
    type = number
    description = "Memory of the container"
}

variable "logdriver" {
    type = string
}

variable "logs_group" {
    type = string
}

variable "stream_prefix" {
    type = string
}

variable "execution_role_arn" {
    type = string
    description = "ARN of the execution role"
}