# Terraform EC2 + Nginx Static Website Hosting

## Project Overview

This project deploys a simple static website on an AWS EC2 instance using Terraform and Nginx.

The infrastructure is fully automated using Infrastructure as Code (IaC) principles with Terraform.

After deployment:
- Terraform creates an EC2 instance
- Security Group allows HTTP and SSH access
- User data installs Nginx automatically
- A custom HTML page is deployed
- Website becomes accessible publicly

---

# Technologies Used

- AWS EC2
- Terraform
- Nginx
- Ubuntu Linux
- SSH
- HTML

---

# Project Architecture

```text
User
  ↓
Public IP
  ↓
AWS Security Group
  ↓
EC2 Instance (Ubuntu)
  ↓
Nginx Web Server
  ↓
index.html Website
