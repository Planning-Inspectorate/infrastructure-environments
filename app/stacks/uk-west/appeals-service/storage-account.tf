resource "azurerm_storage_account" "appeal_documents" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
  #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
  #TODO: Logging
  #checkov:skip=CKV_AZURE_33: Logging not implemented yet
  #checkov:skip=CKV2_AZURE_8: Logging not implemented yet
  #TODO: Access restrictions
  #checkov:skip=CKV_AZURE_35: Network access restrictions
  name                             = replace("pinsstdocs${local.resource_suffix}", "-", "")
  resource_group_name              = azurerm_resource_group.appeals_service_stack.name
  location                         = azurerm_resource_group.appeals_service_stack.location
  account_tier                     = "Standard"
  account_replication_type         = "GRS"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  enable_https_traffic_only        = true
  min_tls_version                  = "TLS1_2"

  tags = local.tags
}

resource "azurerm_storage_container" "documents" {
  #TODO: Logging
  #checkov:skip=CKV2_AZURE_21 Logging not implemented yet
  name                  = "uploads"
  storage_account_name  = azurerm_storage_account.appeal_documents.name
  container_access_type = "private"
}

resource "azurerm_storage_account" "function_apps" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
  #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
  #TODO: Logging
  #checkov:skip=CKV_AZURE_33: Logging not implemented yet
  #checkov:skip=CKV2_AZURE_8: Logging not implemented yet
  #TODO: Access restrictions
  #checkov:skip=CKV_AZURE_35: Network access restrictions

  name                             = replace("pinssthznfns${local.resource_suffix}", "-", "")
  resource_group_name              = azurerm_resource_group.appeals_service_stack.name
  location                         = azurerm_resource_group.appeals_service_stack.location
  account_tier                     = "Standard"
  account_replication_type         = "GRS"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  enable_https_traffic_only        = true
  min_tls_version                  = "TLS1_2"

  tags = local.tags
}
