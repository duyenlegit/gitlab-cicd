variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type = string
}

variable "instance_type" {
  description = "The instance type to launch"
  type = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type = string
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}

variable "vpc_id" {
    description = "The ID of the VPC to create the security group in"
    type = string
}