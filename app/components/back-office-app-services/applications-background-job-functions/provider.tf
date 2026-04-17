terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "> 4"
      configuration_aliases = [azurerm, azurerm.tooling]
    }
  }
}


# terraform {
#   required_providers {
#     azurerm = {
#       source                = "hashicorp/azurerm"
#       version               = "> 4"
#       # configuration_aliases = [azurerm, azurerm.tooling]
#     }
#   }
# }

# provider "azurerm" {
#   features {}
# }

# provider "azurerm" {
#   alias           = "tooling"
#   subscription_id = var.tooling_subscription_id

#   features {}
# }
