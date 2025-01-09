output "ec2_public_ip" {
  value = aws_instance.nginx-server.public_ip
}