output "public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.ubuntu_processor.public_ip
}