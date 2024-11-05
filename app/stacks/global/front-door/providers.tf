terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.6.0"
    }
  }
  required_version = ">= 1.5.7, < 1.10.0"
}

provider "azurerm" {
  features {}
}
