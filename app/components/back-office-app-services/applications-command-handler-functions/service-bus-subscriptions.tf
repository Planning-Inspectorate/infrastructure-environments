resource "azurerm_servicebus_subscription" "deadline_submission_subscription" {
  name                                 = "deadline-submission-subscription"
  topic_id                             = var.servicebus_topic_deadline_submission_topic_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.bo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_servicebus_subscription" "register_nsip_subscription_subscription" {
  name                                 = "register-nsip-subscription-subscription"
  topic_id                             = var.servicebus_topic_register_nsip_subscription_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.bo_subscription_ttl
  dead_lettering_on_message_expiration = true
}

resource "azurerm_servicebus_subscription" "register_representation_subscription" {
  name                                 = "register-representation-subscription"
  topic_id                             = var.servicebus_topic_register_representation_id
  max_delivery_count                   = 1
  default_message_ttl                  = var.service_bus_config.bo_subscription_ttl
  dead_lettering_on_message_expiration = true
}
