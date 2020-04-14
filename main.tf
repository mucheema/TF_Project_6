provider "aws" {
  # Using a dedicated region us east 1
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}
module "my_vpc" {
  source = "../Module/VPC"
  vpc_cidr       = "192.168.0.0/16"
  tenancy = "default"
  vpc_id = module.my_vpc.vpc_id
  subnet_cidr = "192.168.0.0/24"
  gw-id = module.my_vpc.igw-id
}
module "my_ec2" {
  source = "../Module/EC2"
  ec2_count = 1
  ami_id = "ami-09d069a04349dc3cb"
  instance_type = "t2.micro"
  subnet_id = module.my_vpc.subnet_id
}
