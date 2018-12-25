output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${element(concat(aws_vpc.default.*.id, list("")), 0)}"
}

output "private_subnet" {
  description = "private subnet"
  value       = "${element(concat(aws_subnet.private.*.id, list("")), 0)}"
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = ["${aws_subnet.private.*.cidr_block}"]
}

output "public_subnet" {
  description = "public subnet"
  value       = "${element(concat(aws_subnet.public.*.id, list("")), 0)}"
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = ["${aws_subnet.public.*.cidr_block}"]
}
