output "front_door_profile_id" {
  description = "ID of the Azure Front Door Profile"
  value       = azurerm_cdn_frontdoor_profile.default.id
}

output "front_door_origin_group_id" {
  description = "ID of the Azure Front Door Profile"
  value       = azurerm_cdn_frontdoor_origin_group.default.id
}
