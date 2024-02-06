
module "front_door" {
  source = "../../../components/back-office-app-services/front-door"

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
