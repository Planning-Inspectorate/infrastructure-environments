resource "azurerm_application_insights" "node" {
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-appi-${local.service_name}-node-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  location            = azurerm_resource_group.common_infrastructure.location
  application_type    = "Node.JS"
  tags                = local.tags
}
