resource "azurerm_servicebus_namespace" "back_office" {
  name                          = "pins-sb-${local.service_name}-${local.resource_suffix}"
  location                      = azurerm_resource_group.back_office_stack.location
  resource_group_name           = azurerm_resource_group.back_office_stack.name
  sku                           = var.service_bus_failover_enabled ? "Premium" : "Standard"
  capacity                      = var.service_bus_failover_enabled ? 1 : 0
  public_network_access_enabled = !var.service_bus_failover_enabled

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

# Common Topics
resource "azurerm_servicebus_topic" "service_user" {
  name                = "service-user"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

# Topics
resource "azurerm_servicebus_topic" "nsip_project" {
  name                = "nsip-project"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "nsip_project_update" {
  name                = "nsip-project-update"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "nsip_documents" {
  name                = "nsip-document"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "folders" {
  name                = "folder"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "nsip_subscription" {
  name                = "nsip-subscription"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "nsip_exam_timetable" {
  name                = "nsip-exam-timetable"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "nsip_representation" {
  name                = "nsip-representation"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "nsip_s51_advice" {
  name                = "nsip-s51-advice"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

# Commands
resource "azurerm_servicebus_topic" "register_nsip_subscription" {
  name                = "register-nsip-subscription"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "register_representation" {
  name                = "register-representation"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "deadline_submission_topic" {
  name                = "deadline-submission-topic"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "deadline_submission_result" {
  name                = "deadline-submission-result"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

# Appeals FO Producers (Commands)
resource "azurerm_servicebus_topic" "appeal_fo_appellant_submission" {
  name                = var.back_office_appellant_submission_topic
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "appeal_fo_lpa_response_submission" {
  name                = var.back_office_lpa_response_submission_topic
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "listed_building" {
  name                = "listed-building"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

# Appeals BO Producers (Events)
resource "azurerm_servicebus_topic" "appeal_bo_case" {
  name                = "appeal"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "appeal_bo_document" {
  name                = "appeal-document"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

resource "azurerm_servicebus_topic" "appeal_bo_document_to_move" {
  name                = "appeal-document-to-move"
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = "P14D"
}

# Temporary permissions to enable development for ODW
# This is for POC work so will be better formalised once we know what we're building
resource "azurerm_role_assignment" "odw_consumer_permission" {
  count = var.environment == "dev" ? 1 : 0

  scope                = azurerm_servicebus_namespace.back_office.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = "e157655b-90a8-43d9-a429-4273b6074e0d"
}

resource "azurerm_role_assignment" "odw_user_permission" {
  count = var.environment == "dev" ? 1 : 0

  scope                = azurerm_servicebus_namespace.back_office.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = "89c3e08d-bac3-4a9d-9f65-b2262fa529ac"
}
