provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "tooling"
  subscription_id = var.tooling_subscription_id

  features {}
}

variable "tooling_subscription_id" {
  description = "The ID for the Tooling subscription that houses the Container Registry"
  type        = string
}
