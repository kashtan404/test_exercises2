provider "aws" {
  region  = "${var.aws_region}"
}

# Define our VPC
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
  public_subnet_cidr = "${var.public_subnet_cidr}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
  key_path = "${var.key_path}"
}

# Define security groups
module "sgs" {
  source = "./modules/security_groups"
  vpc_id = "${module.vpc.vpc_id}"
}

# Define web server
module "host1" {
  source = "./modules/ec2"
  ami = "${var.ami}"
  key_name = "${var.key_name}"
  subnet = "${module.vpc.public_subnet}"
  security_group = "${module.sgs.security_group_id_web}"
  is_public = "true"
  userdata_file = "userdata_web.sh"
  tag_name = "web"
}

# Define 1st db
module "host2" {
  source = "./modules/ec2"
  ami = "${var.ami}"
  key_name = "${var.key_name}"

  # Why public? Cuz it was easier for me and nothing specified about it in task description
  subnet = "${module.vpc.public_subnet}"
  security_group = "${module.sgs.security_group_id_db}"
  is_public = "true"
  userdata_file = "userdata_db.sh"
  tag_name = "db"
}

# Define 2nd db
module "host3" {
  source = "./modules/ec2"
  ami = "${var.ami}"
  key_name = "${var.key_name}"

  # Why public? Cuz it was easier for me and nothing specified about it in task description
  subnet = "${module.vpc.public_subnet}"
  security_group = "${module.sgs.security_group_id_db}"
  is_public = "true"
  userdata_file = "userdata_db.sh"
  tag_name = "db"
}

data "template_file" "dev_hosts" {
  template = "${file("../ansible/dev_hosts.cfg")}"
  depends_on = [
    "module.host1",
    "module.host2",
    "module.host3"
  ]
  vars {
    node1_ip = "${join(",", module.host1.public_ip)}"
    node2_ip = "${join(",", module.host2.public_ip)}"
    node3_ip = "${join(",", module.host3.public_ip)}"
  }
}

resource "null_resource" "dev-hosts" {
  triggers {
    template_rendered = "${data.template_file.dev_hosts.rendered}"
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.dev_hosts.rendered}' > ../ansible/hosts"
  }
}