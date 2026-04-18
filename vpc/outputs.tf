output "vpc_id" {
  value = aws_vpc.this
}

output "public_subnet_ids" {
  value = [aws_subnet.public-1a.id, aws_subnet.public-1b.id]
}

output "internet_gateway" {
  value = aws_internet_gateway.this
}

output "route_table" {
  value = aws_route_table.public_RT
}
