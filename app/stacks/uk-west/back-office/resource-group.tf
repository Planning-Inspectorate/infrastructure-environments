import {
  id = "/subscriptions/962e477c-0f3b-4372-97fc-a198a58e259e/resourceGroups/pins-rg-back-office-dev-ukw-001"
  to = azurerm_resource_group.back_office_stack
}

resource "azurerm_resource_group" "back_office_stack" {
  name     = "pins-rg-${local.service_name}-${local.resource_suffix}"
  location = module.azure_region_ukw.location

  tags = local.tags
}