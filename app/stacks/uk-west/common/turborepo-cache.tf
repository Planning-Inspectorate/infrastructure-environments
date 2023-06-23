module "turborepo_cache" {
  count = var.create_turbrepo_cache ? 1 : 0

  source = "../../../components/turborepo-cache"

  location            = azurerm_resource_group.common_infrastructure.location
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  key_vault_id        = azurerm_key_vault.environment_key_vault.id
  app_service_plan_id = azurerm_service_plan.common_service_plan.id

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
