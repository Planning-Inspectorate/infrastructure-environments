resource "azurerm_private_dns_zone" "dns" {
  name                = local.domain_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns" {
  name                  = "dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.dns.name
  virtual_network_id    = var.common_vnet_id
}

resource "azurerm_private_dns_a_record" "clamav" {
  name                = local.dns_record_name
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = var.resource_group_name
  ttl                 = 60
  records             = [azurerm_container_group.back_office_containers.ip_address]
}
