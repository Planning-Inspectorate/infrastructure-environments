output "clamav_host" {
  description = "Hostname of the ClamAV Container Group"
  value       = azurerm_container_group.back_office_containers.ip_address
}
