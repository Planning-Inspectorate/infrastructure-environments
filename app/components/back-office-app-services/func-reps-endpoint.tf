# resources for the IDAS reps endpoint
# a function app, with associated app service plan, for analysing representations

resource "azurerm_service_plan" "idas_reps_endpoint" {
  count = var.reps_endpoint_config == null ? 0 : 1

  #checkov:skip=CKV_AZURE_212: Ensure App Service has a minimum number of instances for failover
  #checkov:skip=CKV_AZURE_225: Ensure the App Service Plan is zone redundant
  #checkov:skip=CKV_AZURE_211: plan not suitable for production
  name                = "pins-asp-${var.service_name}-idas-reps-${var.resource_suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location

  os_type  = "Linux"
  sku_name = var.reps_endpoint_config.app_service_plan_sku

  tags = var.tags
}


resource "azurerm_linux_function_app" "idas_reps_endpoint" {
  count = var.reps_endpoint_config == null ? 0 : 1

  name                          = "pins-func-${var.service_name}-idas-reps-${var.resource_suffix}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  service_plan_id               = azurerm_service_plan.idas_reps_endpoint[0].id
  storage_account_name          = var.document_check_function_storage_name
  storage_account_access_key    = var.document_check_function_storage_primary_access_key
  https_only                    = true
  public_network_access_enabled = false

  app_settings = merge({
    BUILD_FLAGS                    = "UseExpressBuild"
    DATABASE_NAME                  = azurerm_mssql_database.idas_reps_endpoint[0].name
    DATEBASE_SERVER                = var.database_server_url
    ENABLE_ORYX_BUILD              = "true"
    ENABLE_PROFILING_ENDPOINT      = "1"
    FUNCTIONS_WORKER_RUNTIME       = "python"
    SCM_DO_BUILD_DURING_DEPLOYMENT = "true"
  }, var.reps_endpoint_config.function_app_settings)

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on     = true
    http2_enabled = true

    application_stack {
      python_version = var.reps_endpoint_config.python_version
    }

    application_insights_key = var.app_insights_instrument_key
  }

  tags = var.tags

  virtual_network_subnet_id = var.back_office_integration_subnet_id

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_mssql_database" "idas_reps_endpoint" {
  count = var.reps_endpoint_config == null ? 0 : 1

  #checkov:skip=CKV_AZURE_224: TODO: Ensure that the Ledger feature is enabled on database that requires cryptographic proof and nonrepudiation of data integrity
  #checkov:skip=CKV_AZURE_229: TODO: Ensure the Azure SQL Database Namespace is zone redundant
  name        = "pins-sqldb-${var.service_name}-idas-reps-${var.resource_suffix}"
  server_id   = var.database_server_id
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  sku_name    = var.reps_endpoint_config.database.sku
  max_size_gb = var.reps_endpoint_config.database.max_size_gb

  tags = var.tags
}

resource "azurerm_private_endpoint" "idas_reps_endpoint_func" {
  count = var.reps_endpoint_config == null ? 0 : 1

  name                = "pins-pe-${var.service_name}-idas-python-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.back_office_integration_subnet_id

  private_dns_zone_group {
    name                 = "pins-pdns-${var.service_name}-funcapp-python-${var.resource_suffix}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.app_service.id]
  }

  private_service_connection {
    name                           = "pins-psc-funcapp-python-${var.resource_suffix}"
    private_connection_resource_id = azurerm_linux_function_app.idas_reps_endpoint[0].id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  tags = var.tags
}
