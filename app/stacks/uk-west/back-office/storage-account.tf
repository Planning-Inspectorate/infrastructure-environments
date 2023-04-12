resource "azurerm_storage_account" "back_office_documents" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
  #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
  #TODO: Logging
  #checkov:skip=CKV_AZURE_33: Logging not implemented yet
  #checkov:skip=CKV2_AZURE_8: Logging not implemented yet
  #TODO: Access restrictions
  #checkov:skip=CKV_AZURE_35: Network access restrictions
  name                             = replace("pinsstdocsbo${local.resource_suffix}", "-", "")
  resource_group_name              = azurerm_resource_group.back_office_stack.name
  location                         = azurerm_resource_group.back_office_stack.location
  account_tier                     = "Standard"
  account_replication_type         = "GRS"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  enable_https_traffic_only        = true
  min_tls_version                  = "TLS1_2"
  tags                             = local.tags
  blob_properties {
    cors_rule {
      allowed_headers    = ["*"]
      allowed_methods    = ["GET", "OPTIONS", "PUT"]
      allowed_origins    = ["https://back-office-${var.environment}.planninginspectorate.gov.uk"]
      exposed_headers    = ["*"]
      max_age_in_seconds = "600"
    }
  }
}

resource "azurerm_storage_container" "back_office_document_service_uploads_container" {
  #TODO: Logging
  #checkov:skip=CKV2_AZURE_21 Logging not implemented yet
  name                  = "document-service-uploads"
  storage_account_name  = azurerm_storage_account.back_office_documents.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "back_office_published_documents_container" {
  #TODO: Logging
  #checkov:skip=CKV2_AZURE_21 Logging not implemented yet
  name                  = "published-documents"
  storage_account_name  = azurerm_storage_account.back_office_documents.name
  container_access_type = "private"
}

resource "azurerm_storage_account" "function_storage" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
  #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
  #TODO: Logging
  #checkov:skip=CKV_AZURE_33: Logging not implemented yet
  #checkov:skip=CKV2_AZURE_8: Logging not implemented yet
  #TODO: Access restrictions
  #checkov:skip=CKV_AZURE_35: Network access restrictions

  name                             = replace("pinsfuncbo${local.resource_suffix}", "-", "")
  resource_group_name              = azurerm_resource_group.back_office_stack.name
  location                         = azurerm_resource_group.back_office_stack.location
  account_tier                     = "Standard"
  account_replication_type         = "GRS"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  enable_https_traffic_only        = true
  min_tls_version                  = "TLS1_2"

  tags = local.tags
}
