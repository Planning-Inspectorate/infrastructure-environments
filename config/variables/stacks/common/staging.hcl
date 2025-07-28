# Staging environment specific configuration for Appeals Service only

locals {
  primary_vnet_address_space                  = "10.21.0.0/16"
  secondary_vnet_address_space                = "10.22.0.0/16"
  create_turbrepo_cache                       = false
  deploy_national_infrastructure_vnet_gateway = false
  log_daily_cap_gb                            = 0.1
}
