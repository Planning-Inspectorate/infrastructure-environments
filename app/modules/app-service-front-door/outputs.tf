output "front_door_profile_id" {
  count = var.environment == "dev" ? 1 : 0

  description = "ID of the Azure Front Door Profile"
  value       = azurerm_cdn_frontdoor_profile.default[count.index].id
}
