resource "aws_ecs_cluster" "medusa" { name = "medusa-cluster" }

resource "aws_ecs_task_definition" "medusa" {
  family                   = "medusa"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_exec_role.arn

  container_definitions = jsonencode([
    {
      name  = "medusa"
      image = "${aws_ecr_repository.medusa_ecr_repo.repository_url}:latest"
      portMappings = [{ containerPort = 9000, protocol = "tcp" }]
     
      }
    
  ])
}

resource "aws_ecs_service" "medusa" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa.id
  task_definition = aws_ecs_task_definition.medusa.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = data.terraform_remote_state.db.outputs.private_subnets
    security_groups  = [data.terraform_remote_state.db.outputs.db_sg_id]
    assign_public_ip = false
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.medusa.arn
    container_name   = "medusa"
    container_port   = 9000
  }
  depends_on = [ aws_lb_listener.http ]
}

resource "aws_lb_target_group" "medusa" {
  name     = "medusa-target-group"
  port     = 9000
  protocol = "HTTP"
  vpc_id    = data.terraform_remote_state.db.outputs.vpc_id

  health_check {
    path                = "/"
    interval             = 30
    timeout              = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  target_type = "ip"
}
