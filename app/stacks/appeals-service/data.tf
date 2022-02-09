data "azurerm_container_registry" "odt" {
  name                = var.container_registry_name
  resource_group_name = var.container_registry_rg
}
