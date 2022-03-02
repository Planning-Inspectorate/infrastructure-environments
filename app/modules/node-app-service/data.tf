data "terraform_remote_state" "container_registry" {
  backend = "azurerm"

  config = var.tooling_remote_state_config
}
