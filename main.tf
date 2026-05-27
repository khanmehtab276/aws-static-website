provider "aws" {
    region = var.aws_region
}

module "security_group" {
    source = "./modules/security-group"
    sg_name = "web-app-sg"
}

module "ec2" {
    source = "./modules/ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    security_group_id = module.security_group.security_group_id
    key_name = var.key_name
}

