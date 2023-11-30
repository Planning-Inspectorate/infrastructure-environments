locals {
  service_name                = "apps-migration"
  resource_suffix             = var.location
  synapse_integration_enabled = var.environment == "dev"
}
