resource "azurerm_monitor_action_group" "low" {
  name                = "pins-ag-low-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  short_name          = "P4-${var.environment}"
  tags                = local.tags

  email_receiver {
    name                    = "P4"
    email_address           = "lester.march@kinandcarta.com"
    use_common_alert_schema = true
  }
}
