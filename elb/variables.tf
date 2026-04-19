variable "vpc_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "elb_sg" {
  type = string
}

variable "protocol" {
  type = string
}