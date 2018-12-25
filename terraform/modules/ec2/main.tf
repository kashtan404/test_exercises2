# Define webserver inside the public subnet
resource "aws_instance" "this" {
   ami  = "${var.ami}"
   instance_type = "${var.instance_type}"
   key_name = "${var.key_name}"
   subnet_id = "${var.subnet}"
   vpc_security_group_ids = ["${var.security_group}"]
   associate_public_ip_address = "${var.is_public}"
   source_dest_check = false
   user_data = "${file(var.userdata_file)}"

  tags {
    Name = "${var.tag_name}"
  }
}
