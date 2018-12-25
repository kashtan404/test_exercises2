# Output ID of sg_web SG we made
output "security_group_id_web" {
  value = "${aws_security_group.sgweb.id}"
}

# Output ID of sg_db SG we made
output "security_group_id_db" {
  value = "${aws_security_group.sgdb.id}"
}
