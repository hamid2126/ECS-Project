output "alb_sg_id" {
description = "id of the alb security group"
value = aws_security_group.alb_sg.id  
}

output "ecs_sg_id" {
description = "id of the ecs security group"
value = aws_security_group.ecs_sg.id
}
