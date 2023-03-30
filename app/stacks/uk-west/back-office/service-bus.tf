resource "azurerm_servicebus_namespace" "back_office" {
  name                = "pins-sb-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  sku                 = var.service_bus_failover_enabled ? "Premium" : "Standard"
  capacity            = var.service_bus_failover_enabled ? 1 : 0

  tags = local.tags
}

# Create a private DNS zone for the SB private endpoint
resource "azurerm_private_dns_zone" "back_office" {
  count = var.service_bus_failover_enabled ? 1 : 0

  name                = "privatelink.servicebus.windows.net"
  resource_group_name = azurerm_resource_group.back_office_stack.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "back_office" {
  count = var.service_bus_failover_enabled ? 1 : 0

  name                  = "service-bus-dns-link"
  resource_group_name   = azurerm_resource_group.back_office_stack.name
  private_dns_zone_name = azurerm_private_dns_zone.back_office[0].name
  virtual_network_id    = var.common_vnet_id
}

# Create a network ruleset to disable public access
resource "azurerm_servicebus_namespace_network_rule_set" "back_office" {
  count = var.service_bus_failover_enabled ? 1 : 0

  namespace_id                  = azurerm_servicebus_namespace.back_office.id
  public_network_access_enabled = false
}

# Create a private endpoint for the namespace
resource "azurerm_private_endpoint" "back_office" {
  count = var.service_bus_failover_enabled ? 1 : 0

  name                = "pins-pe-${local.service_name}-sb-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_dns_zone_group {
    name                 = "pins-pdns-${local.service_name}-sb-${local.resource_suffix}"
    private_dns_zone_ids = [azurerm_private_dns_zone.back_office[0].id]
  }

  private_service_connection {
    name                           = "pins-psc-${local.service_name}-sb-${local.resource_suffix}"
    private_connection_resource_id = azurerm_servicebus_namespace.back_office.id
    is_manual_connection           = false
    subresource_names              = ["namespace"]
  }

  tags = local.tags
}

# Topics
resource "azurerm_servicebus_topic" "nsip_project" {
  name                = "nsip-project"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "employee" {
  name                = "employee"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

# POC Subscription
resource "azurerm_servicebus_subscription" "nsip_project_poc" {
  name               = "nsip-project-poc-subscriber"
  topic_id           = azurerm_servicebus_topic.nsip_project.id
  max_delivery_count = 1
}

resource "azurerm_role_assignment" "nsip_project_poc_rbac" {
  scope                = azurerm_servicebus_subscription.nsip_project_poc.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = data.azurerm_key_vault_secret.odw_synapse_workspace_id.value
}
