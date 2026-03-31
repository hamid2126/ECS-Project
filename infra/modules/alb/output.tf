output "ecs_alb" {
    description = "arn of the ecs alb"
    value = aws_lb.ecs_alb.arn
}

output "alb_tg" {
  description = "arn of the alb target group"
  value = aws_lb_target_group.alb_tg.arn
}

output "dns_name" {
  description = "DNS name for the alb"
  value = aws_lb.ecs_alb.dns_name
}

output "zone_id" {
  description = "Zone ID for the alb"
  value = aws_lb.ecs_alb.zone_id
}