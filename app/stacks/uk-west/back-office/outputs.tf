output "back_office_sql_database" {
  description = "The ID of the Back Office SQL database"
  value       = azurerm_mssql_database.back_office.id
}

output "sql_server_id" {
  description = "The ID of the Back Office SQL server"
  value       = azurerm_mssql_server.back_office.id
}
