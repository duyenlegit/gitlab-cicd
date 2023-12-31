output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnets[*].id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnets[*].id
}

output "default_security_group_id" {
  description = "The ID of the default security group in the created VPC"
  value       = aws_vpc.main.default_security_group_id
}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}