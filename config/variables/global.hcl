locals {
  container_registry_name         = "pinscrsharedtoolinguks"
  container_registry_rg           = "pins-rg-shared-tooling-uks"
  app_service_private_dns_zone_id = "/subscriptions/${local.tooling_subscription_id}/resourceGroups/${local.tooling_network_rg}/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"
  front_door_principal_id         = "c73a3f61-aa0a-4450-b3f8-303d72bf57a9"
  tooling_key_vault_id            = "/subscriptions/${local.tooling_subscription_id}/resourceGroups/${local.tooling_network_rg}/providers/Microsoft.KeyVault/vaults/pinskvsharedtoolinguks"
  tooling_network_name            = "pins-vnet-shared-tooling-uks"
  tooling_network_rg              = "pins-rg-shared-tooling-uks"
  tooling_subscription_id         = "edb1ff78-90da-4901-a497-7e79f966f8e2"
}
