output "node1_ip" {
  value       = "${module.host1.public_ip}"
}

output "node2_ip" {
  value       = "${module.host2.public_ip}"
}

output "node3_ip" {
  value       = "${module.host3.public_ip}"
}
