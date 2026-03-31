variable "task_family" {
    type = string
    description = "Task family name"
}

variable "network_mode" {
    type = string
    description = "Network mode name"
}

variable "execution_role_arn" {
    type = string
    description = "ARN of the execution role"
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
    type = number
    description = "CPU of the container"
}

variable "memory" {
    type = number
    description = "Memory of the container"
}

variable "container_port" {
    type = number
    description = "Port for the container"
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

variable "ecs_sg_id" {
    type = string
    description = "ID of the ECS security group"
}

variable "private_subnets_id" {
    type = list(string)
    description = "IDs of the private subnets"
}

variable "target_group_arn" {
    type = string
    description = "ARN of the target group"
}