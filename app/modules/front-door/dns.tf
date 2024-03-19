# resource "azurerm_dns_cname_record" "default" {
#   depends_on = [azurerm_cdn_frontdoor_route.default]

#   name                = var.service_name
#   zone_name           = azurerm_dns_zone.default.name
#   resource_group_name = azurerm_resource_group.frontdoor.name
#   ttl                 = 3600
#   record              = azurerm_cdn_frontdoor_endpoint.default.host_name
# }
