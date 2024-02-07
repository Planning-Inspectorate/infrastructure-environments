module "front_door" {
  source = "../../../components/back-office-app-services/bo-appeals-front-door"

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}