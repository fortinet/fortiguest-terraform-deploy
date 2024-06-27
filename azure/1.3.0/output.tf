output "ResourceGroup" {
  value = azurerm_resource_group.myterraformgroup.name
}

output "FortiGuestPublicIP" {
  value = format("https://%s", azurerm_public_ip.FortiGuestPublicIP.ip_address)
}

