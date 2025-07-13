resource "aws_lb" "medusa" {
  name               = "medusa-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state.db.outputs.db_sg_id]
  subnets            = data.terraform_remote_state.db.outputs.public_subnets
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.medusa.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.medusa.arn
  }
}
