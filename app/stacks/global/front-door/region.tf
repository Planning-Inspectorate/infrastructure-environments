module "azure_region_uk" {
  #checkov:skip=CKV_TF_1: Use of commit hash is not required for this module, referencing the official Hashicorp module.
  source  = "claranet/regions/azurerm"
  version = "4.2.1"

  azure_region = var.location
}
