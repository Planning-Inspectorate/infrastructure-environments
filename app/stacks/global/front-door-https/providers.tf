terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.106.1"
    }
  }

  required_version = ">= 1.5.7, < 1.8.0"
}

provider "azurerm" {
  features {}
}
