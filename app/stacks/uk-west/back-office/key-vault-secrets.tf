resource "azurerm_key_vault_secret" "back_office_topic_key" {
  name            = "back-office-topic-key"
  content_type    = "text/plain"
  value           = azurerm_servicebus_namespace_authorization_rule.back_office_apps.primary_key
  key_vault_id    = var.key_vault_id
  expiration_date = timeadd(timestamp(), "867834h")

  lifecycle {
    ignore_changes = [
      expiration_date,
      value
    ]
  }
}
