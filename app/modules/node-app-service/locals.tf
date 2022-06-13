locals {
  app_settings = merge(
    var.app_settings,
    {
      DOCKER_ENABLE_CI                = true
      DOCKER_REGISTRY_SERVER_PASSWORD = sensitive(data.azurerm_container_registry.acr.admin_password)
      DOCKER_REGISTRY_SERVER_URL      = data.azurerm_container_registry.acr.login_server
      DOCKER_REGISTRY_SERVER_USERNAME = data.azurerm_container_registry.acr.admin_username
    }
  )

  # Since some App Settings will be URLs to other Azure App Services, this local variable parses each one and does the following:
  # 1. Check if the setting contains an App Service URL. We do this by looking for the '<resource_suffix.azurewebsites.net' string
  # 2. Remove '.azurewebsites.net' string from the end of the URL
  # 3. Truncate the string to 48 characters (this is the number of characters including https:// that Azure use before adding the staging slot in the URL)
  # 4. If the last character after truncation is a '-' remove this too
  # 5. Add "-staging.azurewebsites.net" back at the end of the string to complete the URL
  # 6. Add a '/' character back at the end if the original App Setting included this
  # The final result will be a URL of a staging slot
  staging_slot_app_settings = {
    for k, v in local.app_settings : k => length(regexall("${var.resource_suffix}\\.azurewebsites\\.net\\/?$", v)) > 0 ? length(regexall("\\/$", v)) > 0 ? "${trimsuffix(substr(replace(v, ".azurewebsites.net/", ""), 0, 48), "-")}-staging.azurewebsites.net/" : "${trimsuffix(substr(replace(v, ".azurewebsites.net", ""), 0, 48), "-")}-staging.azurewebsites.net" : v
  }
}
