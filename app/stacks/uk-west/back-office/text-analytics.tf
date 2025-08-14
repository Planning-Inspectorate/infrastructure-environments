locals {
  # objects don't match so we build an object which just the properties we need
  # to avoid error "The true and false result expressions must have consistent types."
  text_analytics_instance = var.text_analytics_config.deploy ? {
    id : azurerm_cognitive_account.text_analytics[0].id,
    endpoint : azurerm_cognitive_account.text_analytics[0].endpoint,
    } : {
    id : data.azurerm_cognitive_account.text_analytics.id,
    endpoint : data.azurerm_cognitive_account.text_analytics.endpoint,
  }
}

# shared instance for non-live environments
data "azurerm_cognitive_account" "text_analytics" {
  name                = "pins-lang-shared-tooling-uks"
  resource_group_name = var.container_registry_rg

  provider = azurerm.tooling
}

# Crown specific instance for live environment
resource "azurerm_cognitive_account" "text_analytics" {
  count = var.text_analytics_config.deploy ? 1 : 0

  #checkov:skip=CKV2_AZURE_22: customer-managed keys not implemented yet
  name                          = "pins-lang-${local.resource_suffix}"
  location                      = azurerm_resource_group.back_office_stack.location
  resource_group_name           = azurerm_resource_group.back_office_stack.name
  kind                          = "TextAnalytics"
  public_network_access_enabled = false
  local_auth_enabled            = false
  custom_subdomain_name         = "pins-lang-${local.resource_suffix}"

  sku_name = "S"

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}

resource "azurerm_private_endpoint" "text_analytics_private_endpoint" {
  count = var.text_analytics_config.deploy ? 1 : 0

  name                = "pins-pe-lang-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_dns_zone_group {
    name                 = "azure-lang-private-dns-zone-group"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.cognitive.id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_cognitive_account.text_analytics[0].id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }

  tags = local.tags
}
