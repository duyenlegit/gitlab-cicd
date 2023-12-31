resource "aws_instance" "fuck1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data     = file("${path.module}/install_new_nodejs_app.sh")
}

resource "aws_security_group" "ec2_security_group" {
  name        = "ec2-sg"
  description = "Security group for EC2 instance to allow ssh and http access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "NodeJs EC2 Security Group"
  }
}