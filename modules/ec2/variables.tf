variable "ami_id" {
    description = "The AMI ID to use for the EC2 instance"
    type = string
}

variable "instance_type" {
    description = "The type of EC2 instance to deploy"
    type = string
}

variable "key_name" {
    description = "The name of the key pair to use for SSH access"
    type = string
}

variable "security_group_id" {
    description = "The ID of the security group to associate with the EC2 instance"
    type = string
}

