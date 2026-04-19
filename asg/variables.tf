variable "project_name" {
  type = string
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

variable "asg_sg_id" {
  type = string
}

variable "user_data" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}