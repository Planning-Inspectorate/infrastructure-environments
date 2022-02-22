terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.97.0"
    }
  }

  required_version = "1.1.6"
}

provider "azurerm" {
  features {}
}
