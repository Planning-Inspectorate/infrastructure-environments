locals {
  sql_database_configuration = {
    max_size_gb               = 1024
    short_term_retention_days = 30 # 7-35
    sku_name                  = "GP_S_Gen5_2"
  }
  sql_server_azuread_administrator = {
    login_username = "sulmarch"
    object_id      = "42523fcb-4a32-4910-8caa-4d310c7bfd55" # sulmarch@pinso365.onmicrosoft.com
  }
}
