data "azurerm_virtual_network" "tooling" {
  name                = var.tooling_network_name
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}
