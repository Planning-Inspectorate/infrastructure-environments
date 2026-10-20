module "azure_region_ukw" {
  #checkov:skip=CKV_TF_1: Use of commit hash is not required for this module, referencing the official Hashicorp module.
  source  = "claranet/regions/azurerm"
  version = "9.0.0"

  azure_region = var.location
}
