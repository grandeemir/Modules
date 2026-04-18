resource "aws_lb_target_group" "this" {
  name     = "${var.project_name}-tg"
  port     = var.elb_port
  protocol = var.protocol
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 2
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
  target_id        = aws_lb_target_group.this
  port             = var.elb_port

}

# ALB (Application Load Balancer) configuration
resource "aws_alb" "this" {
  name            = "${var.project_name}-alb"
  internal        = false
  subnets         = [var.public_subnet_ids[0], var.public_subnet_ids[1]]

  tags = {
    Name = "${var.project_name}-alb"
  }
}