terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "3.107.0"
      configuration_aliases = [azurerm, azurerm.tooling]
    }
  }
  required_version = ">= 1.5.7, < 1.10.0"
}
