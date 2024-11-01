terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 3.0, < 5.0"
      configuration_aliases = [azurerm, azurerm.tooling]
    }
  }
  required_version = ">= 1.5.7, < 1.10.0"
}

# # Adding this in produces an error about overriding. Have a look at what was done originally and start from there again?
# provider "azurerm" {
#   features {}
# }

# provider "azurerm" {
#   alias           = "tooling"
#   subscription_id = var.tooling_subscription_id # add in the var

#   features {}
# }

# variable "tooling_subscription_id" {
#   description = "The ID for the Tooling subscription that houses the Container Registry"
#   type        = string
# }
