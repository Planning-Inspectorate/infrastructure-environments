resource "azurerm_storage_account" "function_storage" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
  #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
  #TODO: Logging
  #checkov:skip=CKV_AZURE_33: Logging not implemented yet
  #checkov:skip=CKV2_AZURE_8: Logging not implemented yet
  #TODO: Access restrictions
  #checkov:skip=CKV_AZURE_35: Network access restrictions

  name                             = replace("pinsappsfunc${local.resource_suffix}", "-", "")
  resource_group_name              = azurerm_resource_group.applications_service_stack.name
  location                         = azurerm_resource_group.applications_service_stack.location
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  enable_https_traffic_only        = true
  min_tls_version                  = "TLS1_2"

  tags = local.tags
}
