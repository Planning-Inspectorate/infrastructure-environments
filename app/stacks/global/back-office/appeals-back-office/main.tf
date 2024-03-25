module "appeals_back_office" {
  source = "../../../../components/back-office-app-services/appeals-back-office-fd"

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
