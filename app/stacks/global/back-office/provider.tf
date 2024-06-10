# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "3.106.1"
#     }
#   }

#   required_version = ">= 1.7.3, < 3.74.0"
# }

# provider "azurerm" {
#   features {}
# }

# provider "azurerm" {
#   alias           = "tooling"
#   subscription_id = var.tooling_subscription_id

#   features {}
# }

# variable "tooling_subscription_id" {
#   description = "The ID for the Tooling subscription that houses the Container Registry"
#   type        = string
# }
