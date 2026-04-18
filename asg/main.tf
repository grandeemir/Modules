# Launch Template for EC2 instances
resource "aws_launch_template" "this" {
  name_prefix   = "${var.project_name}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = null

  network_interfaces {
    security_groups = [var.asg_sg_id]
    subnet_id       = var.public_subnet_ids[0]
  }

  user_data = var.user_data

}

# Auto Scaling Group for EC2 instances
resource "aws_autoscaling_group" "this" {
  name                = "${var.project_name}-asg"
  max_size            = var.asg_max_size
  min_size            = var.asg_min_size
  desired_capacity    = var.asg_desired_capacity
  vpc_zone_identifier = [var.public_subnet_ids[0], var.public_subnet_ids[1]]

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns         = [var.target_group_arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "${var.project_name}-asg-instance"
    propagate_at_launch = true
  }

}