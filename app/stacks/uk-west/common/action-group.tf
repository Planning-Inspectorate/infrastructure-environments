resource "azurerm_monitor_action_group" "low" {
  name                = "pins-ag-low-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  short_name          = "${var.environment}-low"
  tags                = local.tags

  dynamic "email_receiver" {
    for_each = var.alert_recipients["low"]
    iterator = mapping

    content {
      name                    = "Send to ${mapping.value}"
      email_address           = mapping.value
      use_common_alert_schema = true
    }
  }
}
