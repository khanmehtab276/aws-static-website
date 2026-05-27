output "security_group_id" {
    description = "The ID of the created security group"
    value = aws_security_group.web_app_sg.id
}