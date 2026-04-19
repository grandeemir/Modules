# Create a VPC with public and private subnets
resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Create an Internet Gateway and attach it to the VPC
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Create a public route table and associate it with the public subnets
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

resource "aws_route_table_association" "private" {
  count          = 2
  subnet_id      = element([aws_subnet.private-1a.id, aws_subnet.private-1b.id], count.index)
  route_table_id = aws_route_table.private-RT.id
}

resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = element([aws_subnet.public-1a.id, aws_subnet.public-1b.id], count.index)
  route_table_id = aws_route_table.public_RT.id
}

locals {
  public_subnet_cidr    = cidrsubnet(var.cidr_block, 8, 1)
  public_subnet_cidr_2  = cidrsubnet(var.cidr_block, 8, 2)
  private_subnet_cidr   = cidrsubnet(var.cidr_block, 8, 3)
  private_subnet_cidr_2 = cidrsubnet(var.cidr_block, 8, 4)
}

resource "aws_subnet" "public-1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = local.public_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.project_name}-public-subnet"
  }
}

resource "aws_subnet" "public-1b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = local.public_subnet_cidr_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = "${var.project_name}-public-subnet-1b"
  }
}

resource "aws_subnet" "private-1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = local.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.project_name}-private-subnet"
  }
}

resource "aws_subnet" "private-1b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = local.private_subnet_cidr_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = "${var.project_name}-private-subnet-1b"
  }
}