output "elb" {
  value = aws_alb.this
}

output "target_group" {
  value = aws_lb_target_group.this.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.this.arn
}