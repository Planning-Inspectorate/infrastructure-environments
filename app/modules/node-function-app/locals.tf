locals {
  app_settings = {
    SCM_DO_BUILD_DURING_DEPLOYMENT = false
    APPINSIGHTS_INSTRUMENTATIONKEY = var.use_app_insights ? azurerm_application_insights.function_app_insights.instrumentation_key : null
  }
}
