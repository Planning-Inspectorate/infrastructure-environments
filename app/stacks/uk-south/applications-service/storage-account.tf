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
  #checkov:skip=CKV2_AZURE_33: "Ensure storage account is configured with private endpoint"
  #checkov:skip=CKV2_AZURE_38: "Ensure soft-delete is enabled on Azure storage account"
  #checkov:skip=CKV2_AZURE_40: "Ensure storage account is not configured with Shared Key authorization"
  #checkov:skip=CKV2_AZURE_41: "Ensure storage account is configured with SAS expiration policy"
  name                             = replace("pinsappsfunc${local.storage_resource_suffix}", "-", "")
  resource_group_name              = azurerm_resource_group.applications_service_stack.name
  location                         = azurerm_resource_group.applications_service_stack.location
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  https_traffic_only_enabled       = true
  min_tls_version                  = "TLS1_2"

  tags = local.tags
}
