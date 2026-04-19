output "launch_template" {
  value = aws_launch_template.this.arn
}

output "asg" {
  value = aws_autoscaling_group.this.arn
}

