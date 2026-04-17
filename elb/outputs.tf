output "elb" {
  value = aws_alb.this
}

output "target_group" {
  value = aws_lb_target_group.this
}