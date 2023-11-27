# Allow the container to write to the DNS
resource "azurerm_role_assignment" "write_dns_access" {
  scope                = azurerm_private_dns_zone.dns.id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_container_group.back_office_containers.identity[0].principal_id
}
