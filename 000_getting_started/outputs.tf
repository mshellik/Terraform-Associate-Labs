output "instance_public_ip_addr" {
  value       = aws_instance.server_000.public_ip
  description = "The public IP address of the main server instance."
}

