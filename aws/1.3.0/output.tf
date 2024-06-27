
output "FortiGuestPublicIP" {
  value = aws_eip.FortiguestPublicIP.public_ip
}

output "Username" {
  value = "admin"
}
