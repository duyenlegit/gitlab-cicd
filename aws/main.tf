module "vpc" {
  source     = "./vpc"
  # pass any required variables to the VPC module if necessary
}

module "ec2" {
  source                 = "./modules/ec2"
  ami_id                 = "ami-078c1149d8ad719a7" 
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[0] # Replace with your choice of public or private subnet
  vpc_id                 = module.vpc.vpc_id
  vpc_security_group_ids = [module.ec2.ec2_security_group_id]
}