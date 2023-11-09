resource "azurerm_eventgrid_topic" "malware_scanning_topic" {
  name                = "malware-scanning-topic-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.back_office_stack.name
  location            = azurerm_resource_group.back_office_stack.location

  identity {
    type = "SystemAssigned"
  }

  local_auth_enabled            = false
  public_network_access_enabled = false
}
