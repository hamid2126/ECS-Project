output "cluster_id" {
    description = "ID of the cluster"
    value = aws_ecs_cluster.ecs_cluster.id
  
}

output "task_definition_arn" {
  description = "ARN of the task definition"
  value = aws_ecs_task_definition.task_definition.arn 
}