resource "aws_lb" "alb" {
  name                       = "main-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.security_group_id_ingress_alb]
  subnets                    = [var.subnet_id_public_1, var.subnet_id_public_2]
  enable_deletion_protection = false
  idle_timeout               = 60

  tags = {
    Name = "alb"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "aws_lb_listener_rule" {
  listener_arn = aws_lb_listener.alb_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "main-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
  }

  tags = {
    Name = "alb-target-group"
  }
}

resource "aws_lb_target_group_attachment" "alb_target_group_attachment_1" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.instance_id_1
  port             = 80
}

resource "aws_lb_target_group_attachment" "alb_target_group_attachment_2" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.instance_id_2
  port             = 80
}
