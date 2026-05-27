resource "aws_instance" "web_app_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [var.security_group_id]
    key_name = var.key_name

    user_data = file("${path.module}/../../scripts/user-data.sh")

    tags = {
        Name = "terraform-web-server"
    }
}