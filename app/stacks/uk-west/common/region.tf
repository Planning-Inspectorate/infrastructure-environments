module "azure_region_ukw" {
  #checkov:skip=CKV_TF_1: Use of commit hash is not required for this module, referencing the official Hashicorp module.
  #TODO: Upgrade to latest version when possible
  source  = "claranet/regions/azurerm"
  version = "8.0.2"

  azure_region = var.location
}
