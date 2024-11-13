terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 3.0, < 5.0"
      configuration_aliases = [azurerm, azurerm.tooling]
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3"
    }
  }
  required_version = ">= 1.5.7, < 1.10.0"
}
