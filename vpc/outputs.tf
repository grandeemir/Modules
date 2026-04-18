output "vpc_id" {
  value = aws_vpc.this
}

output "public_subnet_1a" {
  value = aws_subnet.public-1a
}

output "public_subnet_1b" {
  value = aws_subnet.public-1b
}

output "private_subnet_1a" {
  value = aws_subnet.private-1a
}

output "private_subnet_1b" {
  value = aws_subnet.private-1b
}

output "internet_gateway" {
  value = aws_internet_gateway.this
}

output "route_table" {
  value = aws_route_table.public_RT
}
