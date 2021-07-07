variable "access_key" {
     description = "AWS console Access key"
}

variable "secret_key" {
     description = "AWS console Secret key"
}

variable "region" {
     default     = "eu-central-1"
     type        = string
     description = "VPC Region"
}

variable "availability_zone" {
     default     = "eu-central-1a"
     type        = string
     description = "Availability Zone"
}

variable "dns_support" {
    default = true
}

variable "dns_hostnames" {
    default = true
}

variable "instance_ten" {
    default = "default"
}

variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "subnet_cidr" {
    default     = "10.0.0.0/17"
    type        = string
    description = "Private subnet CIDR block"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "ec2_ami" {
    default = "ami-0767046d1677be5a0"
}

variable "instance_count" {
    default = "2"
}
