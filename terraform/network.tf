# Create VPC
resource "aws_vpc" "fra_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.dns_support 
  enable_dns_hostnames = var.dns_hostnames
  instance_tenancy     = var.instance_ten
}

# Create Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.fra_vpc.id
}

# VPC private subnet
resource "aws_subnet" "fra_vpc_subnet" {
  vpc_id            = aws_vpc.fra_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
}

# Route table
resource "aws_route_table" "fra_vpc_route_table" {
  vpc_id = aws_vpc.fra_vpc.id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
    }
}

# Associate route table association with subnet
resource "aws_route_table_association" "fra_vpc_association"{
  subnet_id = aws_subnet.fra_vpc_subnet.id
  route_table_id = aws_route_table.fra_vpc_route_table.id
}

# Security Groups
resource "aws_security_group" "fra_vpc_sg" {
  vpc_id       = aws_vpc.fra_vpc.id
  
  # allow ingress of port 22
  ingress {
    cidr_blocks = ["0.0.0.0/0"]  
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  } 
  
  # allow egress of all ports
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}
