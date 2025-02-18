# note: these are a global resources
resource "azurerm_monitor_action_group" "all_action_groups" {
  for_each = local.all_action_groups

  name                = "pins-ag-odt-${each.value}-${var.environment}"
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  short_name          = "CoreServices" # 1-12 chars only
  tags                = local.tags

  # we set emails in the action groups in Azure Portal - to avoid needing to manage
  # emails in terraform
  lifecycle {
    ignore_changes = [
      email_receiver
    ]
  }
}
