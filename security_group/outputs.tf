output "elb_sg" {
  value = aws_security_group.elb_sg
}

output "ec2_sg" {
  value = aws_security_group.ec2_sg
}

output "rds_sg" {
  value = aws_security_group.rds_sg
}

output "asg_sg" {
  value = aws_security_group.asg_sg
}