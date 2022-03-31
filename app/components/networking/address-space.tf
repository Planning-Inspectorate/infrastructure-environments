module "vnet_address_space" {
  source          = "hashicorp/subnets/cidr"
  version         = "1.0.0"
  base_cidr_block = var.base_cidr_block
  networks = [
    {
      name     = "vnet_gateway"
      new_bits = 9 # /25 (123 usable) [0 - 127]
    },
    {
      name     = "cosmosdb_endpoint"
      new_bits = 9 # /25 (123 usable [128 - 255]
    },
    {
      name     = "app_service_integration"
      new_bits = 8 # /24 (251 usable) [0 - 255]
    },
    {
      name     = "appeals_service_endpoints"
      new_bits = 8 # /24 (251 usable) [0 - 255]
    },
    {
      name     = "applications_service_endpoints"
      new_bits = 8 # /24 (251 usable) [0 - 255]
    },
    {
      name     = "back_office_endpoints"
      new_bits = 8 # /24 (251 usable) [0 - 255]
    }
  ]
}
