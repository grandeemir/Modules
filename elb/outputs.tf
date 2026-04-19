output "elb" {
  value = aws_alb.this.arn
}

output "target_group" {
  value = aws_lb_target_group.this.id
}

output "target_group_arn" {
  value = aws_lb_target_group.this.arn
}