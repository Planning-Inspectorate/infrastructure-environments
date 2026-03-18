data "azurerm_monitor_action_group" "devops_action_group" {
  count = var.environment == "prod" ? 1 : 0

  name                = var.action_group.name
  resource_group_name = var.action_group.resource_group_name
}