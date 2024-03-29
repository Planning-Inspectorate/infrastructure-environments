# TODO: Declare this in the uk-west region
resource "azurerm_storage_account" "back_office_containers" {
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
  #checkov:skip=CKV_AZURE_206: TODO: Ensure that Storage Accounts use replication
  name                     = replace("boclamav${var.resource_suffix}", "-", "")
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = var.tags
}

# TODO: Does this need to be multi-az?
resource "azurerm_storage_share" "clamav_db" {
  name                 = "clamav-db"
  storage_account_name = azurerm_storage_account.back_office_containers.name
  quota                = 50
}
