terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "3.6.0"
      configuration_aliases = [azurerm, azurerm.tooling]
    }
  }

  required_version = "1.1.6"
}
