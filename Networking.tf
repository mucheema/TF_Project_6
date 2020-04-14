
# VPC logical name main
# Used varialbe for cidr block
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy

  tags = {
    Name = "main"
  }
}
# Creating a internet gateway and attach with a vpc
resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "main"
  }
}
# Creating the subnet ans attaching with a VPC
resource "aws_subnet" "subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "Main"
  }
}
# Route Table , attach with IGW
resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/24"
    #gateway_id = "${aws_internet_gateway.main_gw.id}"
    gateway_id = var.gw-id
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}
output "subnet_id" {
  value = aws_subnet.subnet.id
}
output "igw-id" {
  value = aws_internet_gateway.gw.id
}

