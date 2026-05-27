output "website_url" {
  value = "http://${module.ec2.public_ip}"
}
