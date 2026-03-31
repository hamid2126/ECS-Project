# Create alb sg
resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ALB security group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb_sg.id

  cidr_ipv4   = var.sg_cidr
  from_port   = var.http_port
  ip_protocol = "tcp"
  to_port     = var.http_port
}

resource "aws_vpc_security_group_ingress_rule" "alb_https" {
  security_group_id = aws_security_group.alb_sg.id

  cidr_ipv4   = var.sg_cidr
  from_port   = var.https_port
  ip_protocol = "tcp"
  to_port     = var.https_port
}

resource "aws_vpc_security_group_egress_rule" "alb_all" {
  security_group_id = aws_security_group.alb_sg.id

  cidr_ipv4   = var.sg_cidr
  ip_protocol = "-1"
}

# Create ecs security group
resource "aws_security_group" "ecs_sg" {
  name        = "ecs_sg"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ECS security group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecs_tcp" {
  security_group_id = aws_security_group.ecs_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id

  from_port   = var.container_port
  ip_protocol = "tcp"
  to_port     = var.container_port
}

resource "aws_vpc_security_group_egress_rule" "ecs_all" {
  security_group_id = aws_security_group.ecs_sg.id
  

  cidr_ipv4   = var.sg_cidr
  ip_protocol = "-1"
}
