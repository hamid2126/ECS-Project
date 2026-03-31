# Create ecs cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster"
}

# Create task definition
resource "aws_ecs_task_definition" "task_definition" {
  family = var.task_family
  network_mode = var.network_mode
  requires_compatibilities = [ "FARGATE" ]
  cpu       = var.cpu
  memory    = var.memory
  execution_role_arn = var.execution_role_arn

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
        }
      ],
      logConfiguration = {
        logDriver = var.logdriver 
        options = {
            "awslogs-group" = var.logs_group
            "awslogs-region" = "eu-north-1"
            "awslogs-stream-prefix" = var.stream_prefix
        }

      }
    }
  ])
}

# Create service
resource "aws_ecs_service" "ecs_service" {
  name            = "ecs-service"
  launch_type = "FARGATE"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 1

  network_configuration {
    security_groups = [ var.ecs_sg_id ]
    subnets = var.private_subnets_id
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name = var.container_name
    container_port = var.container_port
  }
}