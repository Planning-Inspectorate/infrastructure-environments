resource "azurerm_servicebus_subscription" "nsip_project_update_subscription" {
  name               = "nsip-project-update-notify-subscribers-sub" # note name must be <=50 chars
  topic_id           = var.servicebus_topic_nsip_project_update_id
  max_delivery_count = 1

  dead_lettering_on_message_expiration = true
}

# we only need publish messages for this function
resource "azurerm_servicebus_subscription_rule" "nsip_project_update_subscription_rule" {
  name            = "nsip-project-update-notify-subscribers-sub-rule" # note name must be <=50 chars
  subscription_id = azurerm_servicebus_subscription.nsip_project_update_subscription.id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    # filter by applicationProperties
    properties = {
      type = "Publish"
    }
  }
}

resource "azurerm_servicebus_subscription" "nsip_document_published_subscription" {
  name               = "nsip-document-updated-publishing"
  topic_id           = var.servicebus_topic_nsip_documents_id
  max_delivery_count = 1

  dead_lettering_on_message_expiration = true
}

# Since the document is locked for editing after being set to 'publishing', and then finally updated to 'published', this should only trigger one publish
# Regardless, publishing is an idempotent operation so duplicate messages won't matter.
resource "azurerm_servicebus_subscription_rule" "nsip_document_pub_subscription_rule" {
  name            = "back-office-nsip-document-pub-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_document_published_subscription.id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type       = "Update"
      publishing = true
    }
  }
}

resource "azurerm_servicebus_subscription" "nsip_document_unpublished_subscription" {
  name               = "nsip-document-updated-unpublishing"
  topic_id           = var.servicebus_topic_nsip_documents_id
  max_delivery_count = 1

  dead_lettering_on_message_expiration = true
}

resource "azurerm_servicebus_subscription_rule" "nsip_document_unpub_subscription_rule" {
  name            = "back-office-nsip-document-unpub-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_document_unpublished_subscription.id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type         = "Update"
      unpublishing = true
    }
  }
}
