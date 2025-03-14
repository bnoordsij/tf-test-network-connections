
output "instance_ips" {
  value = aws_instance.my-ec2[*].public_ip
}

output "private_ips" {
  value = aws_instance.my-ec2[*].private_ip
}
