output "public_ip" {
  description = "EC2 public ip"
  value       = ["${aws_instance.this.public_ip}"]
}
