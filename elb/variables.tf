variable "vpc_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "public_subnet_1a" {
  type = string
}

variable "public_subnet_1b" {
  type = string
}

variable "elb_sg" {
  type = string
}

variable "elb_port" {
  type = number
}

variable "protocol" {
  type = string
}