// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "fortiguest-vm-terraform"
  location = var.location

  tags = {
    environment = "Fortiguest Terraform"
  }
}
