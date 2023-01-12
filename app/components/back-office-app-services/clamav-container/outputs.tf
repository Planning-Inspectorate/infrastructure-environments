output "clamav_host" {
  description = "Hostname of the ClamAV Container Group"
  value       = azurerm_private_dns_a_record.clamav.fqdn
}
