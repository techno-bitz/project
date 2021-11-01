resource "aws_ecs_cluster" "cluster" {
  name               = "dt1-ecs-cluster"
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = "100"
  }
}

resource "aws_ecs_task_definition" "task" {
  family = "service"
  requires_compatibilities = [
    "FARGATE",
  ]
  execution_role_arn = aws_iam_role.fargate.arn
  network_mode       = "awsvpc"
  cpu                = 256
  memory             = 512
  container_definitions = jsonencode([
    {
      name      = "application"
      image     = "particule/helloworld"
      essential = true
      portMappings = [
      {
        "containerPort": 80
        "hostPort": 80
      
        }
      ]
    }
  ])
}


resource "aws_ecs_service" "service" {
  name            = "dt1-ecs-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1

  network_configuration {
    subnets          = [aws_subnet.public1.id]
    assign_public_ip = true
  }


#load_balancer {
#    target_group_arn = aws_lb_target_group.group.arn
#    container_name   = "dt1-lb"
#    container_port   = 80
#  }



  deployment_controller {
    type = "ECS"
  }
  capacity_provider_strategy {
    base              = 0
    capacity_provider = "FARGATE"
    weight            = 100
  }
}
