resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = [var.private_subnet_ids[0], var.private_subnet_ids[1]]

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }

}

resource "aws_db_instance" "this" {
  identifier             = "${var.project_name}-db-instance"
  multi_az               = var.multi_az
  allocated_storage      = 8
  max_allocated_storage  = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "${var.project_name}_db"
  username               = "admin"
  password               = "password123"
  db_subnet_group_name   = aws_db_subnet_group.this.name
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = [var.rds_sg]

  tags = {
    Name = "${var.project_name}-db-instance"
  }

}

