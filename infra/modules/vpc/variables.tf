variable "vpc_cidr_block" { 
  type        = string
  description = "cidr block for vpc"
  }

variable "enable_dns_hostnames" {
    type = bool
    default = false
}

variable "enable_dns_support" {
    type = bool
    default = false
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

