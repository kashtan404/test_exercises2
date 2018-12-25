variable "vpc_cidr" {
  description = "CIDR for the VPC"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "../id_rsa.pub"
}

variable "key_name" {
  description = "SSH Public Key name"
  default = "vpctestkeypair"
}
