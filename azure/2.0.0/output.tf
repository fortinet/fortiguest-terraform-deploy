output "ResourceGroup" {
  value = azurerm_resource_group.myterraformgroup.name
}

output "FortiGuestPublicIP" {
  value = format("https://%s", var.ExistingPublicIPName.name == "" ? azurerm_public_ip.FortiGuestPublicIP[0].ip_address : data.azurerm_public_ip.ExistingPublicIP[0].ip_address)
}