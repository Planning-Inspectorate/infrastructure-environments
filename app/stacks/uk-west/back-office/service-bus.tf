resource "azurerm_servicebus_namespace" "back_office" {
  #checkov:skip=CKV_AZURE_199: TODO: Ensure that Azure Service Bus uses double encryption
  #checkov:skip=CKV_AZURE_201: TODO: Ensure that Azure Service Bus uses a customer-managed key to encrypt data
  #checkov:skip=CKV_AZURE_202: TODO: Ensure that Managed identity provider is enabled for Azure Service Bus
  #checkov:skip=CKV_AZURE_203: TODO: Ensure Azure Service Bus Local Authentication is disabled
  #checkov:skip=CKV_AZURE_204: TODO: public network access enabled' is set to 'False' for Azure Service Bus
  #checkov:skip=CKV_AZURE_205: TODO: Ensure Azure Service Bus is using the latest version of TLS encryption
  name                          = "pins-sb-${local.service_name}-${local.resource_suffix}"
  location                      = azurerm_resource_group.back_office_stack.location
  resource_group_name           = azurerm_resource_group.back_office_stack.name
  sku                           = var.service_bus_namespace_config.sku
  capacity                      = var.service_bus_namespace_config.capacity
  public_network_access_enabled = var.service_bus_namespace_config.public_network_access_enabled
  premium_messaging_partitions  = var.service_bus_namespace_config.premium_messaging_partitions

  tags = local.tags
}

# Create a private endpoint for the namespace
resource "azurerm_private_endpoint" "back_office" {
  count = var.service_bus_namespace_config.private_endpoint_enabled ? 1 : 0

  name                = "pins-pe-${local.service_name}-sb-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_dns_zone_group {
    name                 = "pins-pdns-${local.service_name}-sb-${local.resource_suffix}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.service_bus.id]
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
  name                = var.sb_topic_names.common.service_user
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

# Topics
resource "azurerm_servicebus_topic" "nsip_project" {
  name                = var.sb_topic_names.applications.events.nsip_project
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "nsip_project_update" {
  name                = var.sb_topic_names.applications.events.nsip_project_update
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "nsip_documents" {
  name                = var.sb_topic_names.applications.events.nsip_documents
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "folders" {
  name                = var.sb_topic_names.applications.events.folders
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "nsip_subscription" {
  name                = var.sb_topic_names.applications.events.nsip_subscription
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "nsip_exam_timetable" {
  name                = var.sb_topic_names.applications.events.nsip_exam_timetable
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "nsip_representation" {
  name                = var.sb_topic_names.applications.events.nsip_representation
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "nsip_s51_advice" {
  name                = var.sb_topic_names.applications.events.nsip_s51_advice
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "dco_portal_data_submissions" {
  name                = var.sb_topic_names.applications.commands.dco_portal_data_submissions
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

# Commands
resource "azurerm_servicebus_topic" "register_nsip_subscription" {
  name                = var.sb_topic_names.applications.commands.register_nsip_subscription
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "register_representation" {
  name                = var.sb_topic_names.applications.commands.register_representation
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "deadline_submission_topic" {
  name                = var.sb_topic_names.applications.commands.deadline_submission_topic
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "deadline_submission_result" {
  name                = var.sb_topic_names.applications.commands.deadline_submission_result
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_topic" "redaction_process_complete" {
  name                = var.sb_topic_names.applications.events.redaction_system_redaction_process_complete
  namespace_id        = azurerm_servicebus_namespace.back_office.id
  default_message_ttl = var.service_bus_config.default_topic_ttl
}

resource "azurerm_servicebus_subscription" "redaction_process_complete" {
  for_each           = local.redaction_process_service_bus_subscribers
  name               = each.key
  topic_id           = azurerm_servicebus_topic.redaction_process_complete.id
  max_delivery_count = 1
}

resource "azurerm_servicebus_subscription_rule" "redaction_process_complete" {
  for_each        = local.redaction_process_service_bus_subscribers
  name            = "subscription_rule"
  subscription_id = azurerm_servicebus_subscription.redaction_process_complete[each.key].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    label = each.key
  }
}
