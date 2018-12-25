variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.12.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.12.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "10.12.2.0/24"
}

variable "ami" {
  description = "Debian 9 AMI us-east-1"
  default = "ami-0f4768a55eaaac3d7"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "../id_rsa.pub"
}

variable "key_name" {
  description = "SSH Public Key name"
  default = "vpctestkeypair"
}

