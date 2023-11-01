# Common infrastructure

This component contains the common infrastructure required by each environment. This component is required by various other components in each environment. For example, the App service plan.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7, < 3.74.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.74.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.74.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_region_uks"></a> [azure\_region\_uks](#module\_azure\_region\_uks) | claranet/regions/azurerm | 4.2.1 |
| <a name="module_networking"></a> [networking](#module\_networking) | ../../../components/networking | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_zone.redis_cache_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.redis_cache_vnet_link](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_resource_group.common_infrastructure](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/resource_group) | resource |
| [azurerm_service_plan.common_integration_functions_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/service_plan) | resource |
| [azurerm_service_plan.common_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_plan_sku"></a> [app\_service\_plan\_sku](#input\_app\_service\_plan\_sku) | The SKU of the App Service Plan | `string` | `"P2v2"` | no |
| <a name="input_applications_service_vpn_gateway_shared_key"></a> [applications\_service\_vpn\_gateway\_shared\_key](#input\_applications\_service\_vpn\_gateway\_shared\_key) | The applications service virtual network gateway shared key | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common resource tags for the project | `map(string)` | n/a | yes |
| <a name="input_cosmosdb_enable_public_access"></a> [cosmosdb\_enable\_public\_access](#input\_cosmosdb\_enable\_public\_access) | A flag to indicate if the database can be accessed over the internet | `string` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_instance"></a> [instance](#input\_instance) | The environment instance for use if multiple environments are deployed to a subscription | `string` | `"001"` | no |
| <a name="input_integration_functions_app_service_plan_sku"></a> [integration\_functions\_app\_service\_plan\_sku](#input\_integration\_functions\_app\_service\_plan\_sku) | The SKU of the App Service Plan | `string` | `"P2v2"` | no |
| <a name="input_is_dr_deployment"></a> [is\_dr\_deployment](#input\_is\_dr\_deployment) | A flag to indicate whether or not the infrastructure deployment is for a disaster recovery scenario | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location resources are deployed to in slug format e.g. 'uk-west' | `string` | `"uk-south"` | no |
| <a name="input_secondary_vnet_address_space"></a> [secondary\_vnet\_address\_space](#input\_secondary\_vnet\_address\_space) | The CIDR address space for the common virtual network | `string` | n/a | yes |
| <a name="input_tooling_network_name"></a> [tooling\_network\_name](#input\_tooling\_network\_name) | The name of the VNet in the Tooling environment | `string` | n/a | yes |
| <a name="input_tooling_network_region_short"></a> [tooling\_network\_region\_short](#input\_tooling\_network\_region\_short) | The region in which the Tooling VNet resides in short format e.g. 'uks' | `string` | n/a | yes |
| <a name="input_tooling_network_rg"></a> [tooling\_network\_rg](#input\_tooling\_network\_rg) | The name of the resource group containing the VNet in the Tooling environment | `string` | n/a | yes |
| <a name="input_tooling_subscription_id"></a> [tooling\_subscription\_id](#input\_tooling\_subscription\_id) | The ID for the Tooling subscription that houses the Container Registry | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_plan_id"></a> [app\_service\_plan\_id](#output\_app\_service\_plan\_id) | The id of the app service plan |
| <a name="output_applications_service_vpn_gateway_shared_key"></a> [applications\_service\_vpn\_gateway\_shared\_key](#output\_applications\_service\_vpn\_gateway\_shared\_key) | The applications service virtual network gateway shared key |
| <a name="output_back_office_clamav_subnet_id"></a> [back\_office\_clamav\_subnet\_id](#output\_back\_office\_clamav\_subnet\_id) | Integration subnet for the clamav container |
| <a name="output_back_office_integration_subnet_id"></a> [back\_office\_integration\_subnet\_id](#output\_back\_office\_integration\_subnet\_id) | Integration subnet for back office anti-virus resources |
| <a name="output_common_integration_functions_subnet_id"></a> [common\_integration\_functions\_subnet\_id](#output\_common\_integration\_functions\_subnet\_id) | Integration subnet for the common integrations functions subnet |
| <a name="output_common_redis_cache_dns_zone_id"></a> [common\_redis\_cache\_dns\_zone\_id](#output\_common\_redis\_cache\_dns\_zone\_id) | The id of the Redis Cache Private DNS Zone |
| <a name="output_common_resource_group_name"></a> [common\_resource\_group\_name](#output\_common\_resource\_group\_name) | The name of the common infrastructure resource group |
| <a name="output_common_vnet_cidr_blocks"></a> [common\_vnet\_cidr\_blocks](#output\_common\_vnet\_cidr\_blocks) | A map of IP address blocks from the subnet name to the allocated CIDR prefix |
| <a name="output_common_vnet_gateway_id"></a> [common\_vnet\_gateway\_id](#output\_common\_vnet\_gateway\_id) | The id of the common infrastructure virtual network gateway |
| <a name="output_common_vnet_name"></a> [common\_vnet\_name](#output\_common\_vnet\_name) | The name of the common infrastructure virtual network |
| <a name="output_cosmosdb_subnet_id"></a> [cosmosdb\_subnet\_id](#output\_cosmosdb\_subnet\_id) | The id of the Cosmos DB endpoint subnet |
| <a name="output_integration_functions_app_service_plan_id"></a> [integration\_functions\_app\_service\_plan\_id](#output\_integration\_functions\_app\_service\_plan\_id) | The id of the integration app service plan |
| <a name="output_integration_subnet_id"></a> [integration\_subnet\_id](#output\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The ID of the Virtual Network |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
