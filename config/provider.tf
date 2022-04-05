terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.2"
    }
  }

  required_version = "1.1.6"
}

provider "azurerm" {
  features {}
}

provider "random" {}
