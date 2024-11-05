terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.6.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~>0.9"
    }
  }
  required_version = ">= 1.5.7, < 1.10.0"
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "tooling"
  subscription_id = var.tooling_subscription_id
  features {}
}
