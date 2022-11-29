# Networking

This module contains the networking resources for the PINS ODT environments. These are placed in a sub-module as they need to be deployed to multiple Locations.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.6.0 |
| <a name="provider_azurerm.tooling"></a> [azurerm.tooling](#provider\_azurerm.tooling) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vnet_address_space"></a> [vnet\_address\_space](#module\_vnet\_address\_space) | hashicorp/subnets/cidr | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_zone_virtual_network_link.app_service_vnet_link](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.cosmosdb_vnet_link](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.vnet_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/public_ip) | resource |
| [azurerm_subnet.back_office_integration_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/subnet) | resource |
| [azurerm_subnet.cosmosdb](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/subnet) | resource |
| [azurerm_subnet.integration_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/subnet) | resource |
| [azurerm_subnet.vnet_gateway_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.common_infrastructure](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_gateway.common](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_peering.env_to_tooling](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.tooling_to_env](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network.tooling](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_cidr_block"></a> [base\_cidr\_block](#input\_base\_cidr\_block) | The CIDR address space for the virtual network | `string` | n/a | yes |
| <a name="input_cosmosdb_enable_public_access"></a> [cosmosdb\_enable\_public\_access](#input\_cosmosdb\_enable\_public\_access) | A flag to indicate if the database can be accessed over the internet | `string` | `false` | no |
| <a name="input_deploy_national_infrastructure_vnet_gateway"></a> [deploy\_national\_infrastructure\_vnet\_gateway](#input\_deploy\_national\_infrastructure\_vnet\_gateway) | A flag to determine if the VNet gateway to the National Infrastructure subscription should be deployed | `bool` | n/a | yes |
| <a name="input_env_network_region_short"></a> [env\_network\_region\_short](#input\_env\_network\_region\_short) | The location resources are deployed to in short format e.g. 'uks' | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location resources are deployed to in slug format e.g. 'uk-south' | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group that will contain the App Services | `string` | n/a | yes |
| <a name="input_resource_suffix"></a> [resource\_suffix](#input\_resource\_suffix) | The suffix for resource naming | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the service the Azure App Services are part of | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags applied to all resources | `map(string)` | `{}` | no |
| <a name="input_tooling_network_name"></a> [tooling\_network\_name](#input\_tooling\_network\_name) | The name of the VNet in the Tooling environment | `string` | n/a | yes |
| <a name="input_tooling_network_region_short"></a> [tooling\_network\_region\_short](#input\_tooling\_network\_region\_short) | The region in which the Tooling VNet resides in short format e.g. 'uks' | `string` | n/a | yes |
| <a name="input_tooling_network_rg"></a> [tooling\_network\_rg](#input\_tooling\_network\_rg) | The name of the resource group containing the VNet in the Tooling environment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_back_office_integration_subnet_id"></a> [back\_office\_integration\_subnet\_id](#output\_back\_office\_integration\_subnet\_id) | Integration subnet for back office anti-virus resources |
| <a name="output_cosmosdb_subnet_id"></a> [cosmosdb\_subnet\_id](#output\_cosmosdb\_subnet\_id) | The id of the Cosmos DB endpoint subnet |
| <a name="output_integration_subnet_id"></a> [integration\_subnet\_id](#output\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic |
| <a name="output_vnet_cidr_blocks"></a> [vnet\_cidr\_blocks](#output\_vnet\_cidr\_blocks) | A map of IP address blocks from the subnet name to the allocated CIDR prefix |
| <a name="output_vnet_gateway_id"></a> [vnet\_gateway\_id](#output\_vnet\_gateway\_id) | The id of the common infrastructure virtual network gateway |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The ID of the Virtual Network |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The name of the common infrastructure virtual network |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
