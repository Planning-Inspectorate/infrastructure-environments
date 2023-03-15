locals {
  node_environment                                 = "production"
  azuread_auth_client_id                           = "7cab8971-c305-4b9a-82db-21b5fd84efbd"
  azuread_auth_api_client_id                       = "425ed677-a747-4c03-9226-b369c3a635c5"
  azuread_appeals_case_officer_group_id            = "5d82e08c-8f05-40ea-a3df-d306f3a2c870"
  azuread_appeals_inspector_group_id               = "c921094a-318f-4996-be5e-9bd2ef9b7bdf"
  azuread_appeals_validation_officer_group_id      = "76d99e25-b02b-4400-96d2-bb9393bbdb9d"
  azuread_applications_case_admin_officer_group_id = "b8bb03d5-9162-4f35-9ff3-856be16dff23"
  azuread_applications_caseteam_group_id           = "ac136ed4-241a-459e-9b4e-267939fd4f08"
  azuread_applications_inspector_group_id          = "9dbf4271-7823-45ed-b1a7-3712f6f2faa3"
  service_bus_failover_enabled                     = false
  sql_database_configuration = {
    max_size_gb               = 2
    short_term_retention_days = 7 # 7-35
    sku_name                  = "Basic"
  }
  sql_server_azuread_administrator = {
    login_username = "sulmarch"
    object_id      = "42523fcb-4a32-4910-8caa-4d310c7bfd55" # sulmarch@pinso365.onmicrosoft.com
  }
  feature_service_bus_enabled                      = "true"
  feature_client_credentials_grant_enabled         = "true"
  feature_document_scanning_enabled                = true
  feature_document_scanning_enabled                = "true"
}
