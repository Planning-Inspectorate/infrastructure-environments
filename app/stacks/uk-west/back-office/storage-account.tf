locals {
  allowed_origins_prod  = [var.back_office_public_url_new != null ? "https://${var.back_office_public_url_new}" : ""]
  allowed_origins_live  = ["https://${var.back_office_public_url}"]
  allowed_origins_local = ["https://localhost:8080"]
  allowed_origins = {
    dev     = concat(local.allowed_origins_live, local.allowed_origins_local),
    test    = local.allowed_origins_live
    prod    = local.allowed_origins_prod
    default = local.allowed_origins_live
  }
}

resource "azurerm_storage_account" "back_office_documents" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
  #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
  #TODO: Logging
  #checkov:skip=CKV_AZURE_33: Logging not implemented yet
  #checkov:skip=CKV2_AZURE_8: Logging not implemented yet
  #TODO: Access restrictions
  #checkov:skip=CKV_AZURE_35: Network access restrictions
  #checkov:skip=CKV_AZURE_59: TODO: Ensure that Storage accounts disallow public access
  #checkov:skip=CKV_AZURE_190: TODO: Ensure that Storage blobs restrict public access
  name                             = replace("pinsstdocsbo${local.storage_resource_suffix}", "-", "")
  resource_group_name              = azurerm_resource_group.back_office_stack.name
  location                         = azurerm_resource_group.back_office_stack.location
  account_tier                     = "Standard"
  account_replication_type         = "GRS"
  allow_nested_items_to_be_public  = true
  cross_tenant_replication_enabled = false
  https_traffic_only_enabled       = true
  min_tls_version                  = "TLS1_2"
  tags                             = local.tags
  blob_properties {
    cors_rule {
      allowed_headers    = ["*"]
      allowed_methods    = ["GET", "OPTIONS", "PUT"]
      allowed_origins    = lookup(local.allowed_origins, var.environment, local.allowed_origins["default"])
      exposed_headers    = ["*"]
      max_age_in_seconds = "600"
    }
  }
}

resource "azurerm_eventgrid_system_topic" "back_office_documents_system_topic" {
  name                = "upload-blob-events"
  resource_group_name = azurerm_resource_group.back_office_stack.name
  location            = azurerm_resource_group.back_office_stack.location
  # The resource ID can only be scoped to the storage account, not the container. Container filtering is done on the subscription.
  source_arm_resource_id = azurerm_storage_account.back_office_documents.id
  topic_type             = "Microsoft.Storage.StorageAccounts"
}

# Temporary storage for documents from front office before they're submitted
resource "azurerm_storage_container" "back_office_submissions_container" {
  #TODO: Logging
  #checkov:skip=CKV2_AZURE_21 Logging not implemented yet
  name                  = "application-submission-documents"
  storage_account_name  = azurerm_storage_account.back_office_documents.name
  container_access_type = "private"
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
  #checkov:skip=CKV_AZURE_34 We want public access to be enabled
  name                  = "published-documents"
  storage_account_name  = azurerm_storage_account.back_office_documents.name
  container_access_type = "blob"
}

# Shared storage between back office appps for Azure Functions
resource "azurerm_storage_account" "function_storage" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
  #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
  #TODO: Logging
  #checkov:skip=CKV_AZURE_33: Logging not implemented yet
  #checkov:skip=CKV2_AZURE_8: Logging not implemented yet
  #TODO: Access restrictions
  #checkov:skip=CKV_AZURE_35: Network access restrictions
  #checkov:skip=CKV_AZURE_59: TODO: Ensure that Storage accounts disallow public access
  #checkov:skip=CKV_AZURE_206: TODO: Ensure that Storage Accounts use replication

  name                             = replace("pinsfuncbo${local.resource_suffix}", "-", "")
  resource_group_name              = azurerm_resource_group.back_office_stack.name
  location                         = azurerm_resource_group.back_office_stack.location
  account_tier                     = "Standard"
  account_replication_type         = "GRS"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  https_traffic_only_enabled       = true
  min_tls_version                  = "TLS1_2"

  tags = local.tags
}

module "apply_blob_container_legal_hold" {
  blob_store_account_container_pairs = [
    {
      blob_account_name : azurerm_storage_account.back_office_documents.name,
      blob_container_name : azurerm_storage_container.back_office_document_service_uploads_container.name
    }
  ]
  # depends_on property guarantees that the containers and account
  # exists before the script runs
  depends_on = [
    azurerm_storage_account.back_office_documents,
    azurerm_storage_container.back_office_document_service_uploads_container
  ]
  legal_hold_tags = ["LegalHold"]
  source          = "../../../components/apply-blob-container-legal-hold"
}
