variable "instance_type" {
  description = "Instance type"
  default = "t2.medium"
}

variable "ami" {}

variable "key_name" {}

variable "subnet" {}

variable "security_group" {}

variable "is_public" {
  description = "Make EC2 instance public accessable"
}

variable "userdata_file" {}

variable "tag_name" {}
