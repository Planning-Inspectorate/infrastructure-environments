variable "subscription_id" {
  description = "The subscription ID of the subscription terraform is deploying to"
  type        = string
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.94.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
