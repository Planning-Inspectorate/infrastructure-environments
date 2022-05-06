locals {
  azuread_auth_case_officer_group_id      = "5d82e08c-8f05-40ea-a3df-d306f3a2c870"
  azuread_auth_client_id                  = "2dc22997-3900-4602-b3bd-46385b60e2b2"
  azuread_auth_inspector_group_id         = "c921094a-318f-4996-be5e-9bd2ef9b7bdf"
  azuread_auth_validation_office_group_id = "76d99e25-b02b-4400-96d2-bb9393bbdb9d"
  node_environment                        = "production"
  sql_database_configuration = {
    max_size_gb               = 2
    short_term_retention_days = 7 # 7-35
    sku_name                  = "Basic"
  }
  sql_server_azuread_administrator = {
    login_username = "sulmarch"
    object_id      = "42523fcb-4a32-4910-8caa-4d310c7bfd55" # sulmarch@pinso365.onmicrosoft.com
  }
}
