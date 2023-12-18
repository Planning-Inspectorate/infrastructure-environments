module "front_door" {
  for_each = var.endpoints

  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/azure-front-door?ref=1.10"

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
