terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "> 4"
    }
  }

  required_version = ">= 1.11.0, < 1.13.0"
}

provider "azurerm" {
  features {}
}
