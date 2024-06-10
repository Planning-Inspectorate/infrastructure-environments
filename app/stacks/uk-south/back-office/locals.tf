locals {
  service_name = "back-office"
  # TODO: 'back_office_sql_database' is an ID, not a name - this won't work surely?

  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  # keep the suffix short for training env, as it can only be upto 24 characters total for azurerm_storage_account
  storage_resource_suffix = var.environment == "training" ? "${var.environment}-${module.azure_region_uks.location_short}" : local.resource_suffix


  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_uks.location
      ServiceName = local.service_name
    }
  )

  bo_applications_tech_emails = [for rec in data.azurerm_monitor_action_group.bo_applications_tech.email_receiver : rec.email_address]
  tech_emails                 = local.bo_applications_tech_emails
}
