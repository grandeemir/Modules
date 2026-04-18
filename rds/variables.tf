variable "project_name" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "rds_sg" {
  type = string
}

variable "multi_az" {
  type    = bool
}