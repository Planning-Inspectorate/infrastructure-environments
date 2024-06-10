terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "3.106.1"
      configuration_aliases = [azurerm, azurerm.tooling]
    }
  }
}
