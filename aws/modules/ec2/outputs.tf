output "ec2_security_group_id" {
  value = aws_security_group.ec2_security_group.id
}

output "ec2_public_ip" {
  value = aws_instance.fuck1.public_ip
  description = "The public IP address of the EC2 instance."
}
