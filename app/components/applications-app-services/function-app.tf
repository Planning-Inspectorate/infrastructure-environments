module "back_office_subscribers" {
  #checkov:skip=CKV_TF_1: Use of commit hash are not required for our Terraform modules 
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.16"

  action_group_ids                         = var.action_group_ids
  app_name                                 = "bo-subscribers"
  app_service_plan_id                      = var.app_service_plan_id
  function_apps_storage_account            = var.function_storage_name
  function_apps_storage_account_access_key = var.function_storage_primary_access_key
  integration_subnet_id                    = var.integration_subnet_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  outbound_vnet_connectivity               = true
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  service_name                             = "applications-service"
  use_app_insights                         = true
  function_node_version                    = 18

  app_settings = {
    ServiceBusConnection__fullyQualifiedNamespace = "${var.back_office_service_bus_namespace_name}.servicebus.windows.net"
    APPLICATIONS_SERVICE_API_URL                  = "https://pins-app-${var.service_name}-applications-api-${var.resource_suffix}.azurewebsites.net"
    DATABASE_URL                                  = "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/applications-service-sql-server-connection-string/)"
  }

  tags = var.tags
}

# nsip-project

resource "azurerm_servicebus_subscription" "nsip_project_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-project-subscription"
  topic_id                             = var.back_office_service_bus_nsip_project_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_project_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_project_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-project-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_project_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Publish"
    }
  }
}

# nsip-project-unpublish
resource "azurerm_servicebus_subscription" "nsip_project_unpublish_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-project-unpublish"
  topic_id                             = var.back_office_service_bus_nsip_project_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_project_unpublish_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_project_unpublish_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_project_unpublish_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-project-unpublish"
  subscription_id = azurerm_servicebus_subscription.nsip_project_unpublish_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Unpublish"
    }
  }
}


# nsip-document

resource "azurerm_servicebus_subscription" "nsip_document_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-document-subscription"
  topic_id                             = var.back_office_service_bus_nsip_document_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_document_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_document_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_document_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-document-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_document_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Publish"
    }
  }
}

# nsip-document-unpublish
resource "azurerm_servicebus_subscription" "nsip_document_unpublish_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-document-unpublish"
  topic_id                             = var.back_office_service_bus_nsip_document_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_document_unpublish_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_document_unpublish_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_document_unpublish_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-document-unpublish"
  subscription_id = azurerm_servicebus_subscription.nsip_document_unpublish_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Unpublish"
    }
  }
}

# nsip-project-update

resource "azurerm_servicebus_subscription" "nsip_project_update_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-project-update-subscription"
  topic_id                             = var.back_office_service_bus_nsip_project_update_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_project_update_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_project_update_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_project_update_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-project-update-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_project_update_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Publish"
    }
  }
}

# nsip-project-update-unpublish

resource "azurerm_servicebus_subscription" "nsip_project_update_unpublish_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-project-update-unpublish"
  topic_id                             = var.back_office_service_bus_nsip_project_update_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_project_update_unpublish_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_project_update_unpublish_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_project_update_unpublish_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-project-update-unpublish"
  subscription_id = azurerm_servicebus_subscription.nsip_project_update_unpublish_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Unpublish"
    }
  }
}

# nsip-representation - PUBLISH

resource "azurerm_servicebus_subscription" "nsip_representation_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-representation"
  topic_id                             = var.back_office_service_bus_nsip_representation_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_representation_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_representation_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_representation_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-representation-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_representation_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Publish"
    }
  }
}

# nsip-representation - UPDATE

resource "azurerm_servicebus_subscription" "nsip_representation_update_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-representation-update"
  topic_id                             = var.back_office_service_bus_nsip_representation_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_representation_update_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_representation_update_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_representation_update_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-rep-update-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_representation_update_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Update"
    }
  }
}

# nsip-exam_timetable

resource "azurerm_servicebus_subscription" "nsip_exam_timetable_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-exam-timetable"
  topic_id                             = var.back_office_service_bus_nsip_exam_timetable_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_exam_timetable_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_exam_timetable_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_exam_timetable_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-exam-timetable-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_exam_timetable_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Publish"
    }
  }
}

#nsip-exam-timetable-unpublish

resource "azurerm_servicebus_subscription" "nsip_exam_timetable_unpublish_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-exam-timetable-unpublish"
  topic_id                             = var.back_office_service_bus_nsip_exam_timetable_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_exam_timetable_unpublish_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_exam_timetable_unpublish_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_exam_timetable_unpublish_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-exam-timetable-unpublish"
  subscription_id = azurerm_servicebus_subscription.nsip_exam_timetable_unpublish_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Unpublish"
    }
  }
}

# nsip-advice
resource "azurerm_servicebus_subscription" "nsip_advice_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-advice"
  topic_id                             = var.back_office_service_bus_nsip_advice_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_advice_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_advice_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_advice_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-advice-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_advice_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Publish"
    }
  }
}

# nsip-advice-unpublish
resource "azurerm_servicebus_subscription" "nsip_advice_unpublish_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-advice-unpublish"
  topic_id                             = var.back_office_service_bus_nsip_advice_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_advice_unpublish_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_advice_unpublish_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_advice_unpublish_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-advice-unpublish"
  subscription_id = azurerm_servicebus_subscription.nsip_advice_unpublish_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Unpublish"
    }
  }
}
# nsip-service-user
resource "azurerm_servicebus_subscription" "nsip_service_user_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-service-user"
  topic_id                             = var.back_office_service_bus_nsip_service_user_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_service_user_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_service_user_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_service_user_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-service-user-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_service_user_topic_subscription[0].id
  filter_type     = "SqlFilter"
  sql_filter      = "type = 'Publish' AND entityType IN ('Applicant', 'RepresentationContact')"
}

# nsip-service-user-unpublish
resource "azurerm_servicebus_subscription" "nsip_service_user_unpublish_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name                                 = "applications-nsip-service-user-unpublish"
  topic_id                             = var.back_office_service_bus_nsip_service_user_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.fo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_role_assignment" "nsip_service_user_unpublish_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_service_user_unpublish_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_service_user_unpublish_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-service-user-unpublish"
  subscription_id = azurerm_servicebus_subscription.nsip_service_user_unpublish_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Unpublish"
    }
  }
}
