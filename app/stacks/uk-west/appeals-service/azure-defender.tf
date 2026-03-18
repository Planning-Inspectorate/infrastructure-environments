moved {
  from = azurerm_advanced_threat_protection.appeal_documents
  to   = azurerm_advanced_threat_protection.appeal_documents[0]
}

resource "azurerm_advanced_threat_protection" "appeal_documents" {
  count              = var.environment != "staging" ? 1 : 0
  target_resource_id = azurerm_storage_account.appeal_documents.id
  enabled            = true
}
