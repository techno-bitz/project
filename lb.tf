   
resource "aws_lb" "alb" {
  name               = "dt1-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public1.id,aws_subnet.public2.id]
}

resource "aws_lb_target_group" "group" {
  name        = "dt1-target-group"
  port        = 80
  protocol    = "http"
  vpc_id      = "awsvpc.vpc.id"
  target_type = "ip"

  depends_on = [aws_lb.alb]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.group.arn
  }
}
