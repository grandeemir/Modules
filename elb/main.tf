resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_alb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group" "this" {
  name     = "${var.project_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-299"
  }

  tags = {
    Name = "${var.project_name}-tg"
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = aws_instance.web.id
  port             = 80
}

# ALB (Application Load Balancer) configuration
resource "aws_lb" "this" {
  name            = "${var.project_name}-alb"
  load_balancer_type = "application"
  internal        = false
  security_groups = [var.elb_sg]
  subnets         = [var.public_subnet_ids[0], var.public_subnet_ids[1]]

  tags = {
    Name = "${var.project_name}-alb"
  }
}