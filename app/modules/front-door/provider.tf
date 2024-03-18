terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "~> 3.0"
      configuration_aliases = [azurerm, azurerm.tooling]
    }
  }

  required_version = ">= 1.5.7, < 3.96.0"
}



