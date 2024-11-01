terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=4.6.0"
      configuration_aliases = [azurerm, azurerm.tooling]
    }
  }
  required_version = ">= 1.5.7, < 1.10.0"
}
