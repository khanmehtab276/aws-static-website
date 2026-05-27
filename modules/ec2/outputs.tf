output "public_ip" {
  value = aws_instance.web_app_instance.public_ip
}