data "azurerm_resource_group" "pins_rg_back_office" {
  name = "pins-rg-back-office-dev-ukw-001"
}

data "azurerm_storage_account" "pinsstdocsbodevukw001" {
  name                = "pinsstdocsbodevukw001"
  resource_group_name = "pins-rg-back-office-dev-ukw-001"
}
