# Common infrastructure

This component contains the common infrastructure required by each environment. This component is required by various other components in each environment. For example, the App service plan.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.97.0 |
| <a name="provider_azurerm.tooling"></a> [azurerm.tooling](#provider\_azurerm.tooling) | 2.97.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_region_uks"></a> [azure\_region\_uks](#module\_azure\_region\_uks) | claranet/regions/azurerm | 4.2.1 |
| <a name="module_common_vnet_address_space"></a> [common\_vnet\_address\_space](#module\_common\_vnet\_address\_space) | hashicorp/subnets/cidr | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_plan.common_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_application_insights.node](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_key_vault.environment_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.applications_service_vpn_gateway_shared_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_private_dns_zone_virtual_network_link.private_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.vnet_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.common_infrastructure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.app_gateway_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.integration_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.vnet_gateway_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.common_infrastructure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_gateway.common](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_peering.tooling](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault_secret.applications_service_vpn_gateway_shared_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_virtual_network.tooling](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common resource tags for the project | `map(string)` | n/a | yes |
| <a name="input_common_vnet_address_space"></a> [common\_vnet\_address\_space](#input\_common\_vnet\_address\_space) | The CIDR address space for the common virtual network | `string` | `"10.0.0.0/16"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_instance"></a> [instance](#input\_instance) | The environment instance for use if multiple environments are deployed to a subscription | `string` | `"001"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region resources are deployed to in slug format e.g. 'uk-south' | `string` | `"uk-south"` | no |
| <a name="input_tooling_network_name"></a> [tooling\_network\_name](#input\_tooling\_network\_name) | The name of the VNet in the Tooling environment | `string` | n/a | yes |
| <a name="input_tooling_network_rg"></a> [tooling\_network\_rg](#input\_tooling\_network\_rg) | The name of the resource group containing the VNet in the Tooling environment | `string` | n/a | yes |
| <a name="input_tooling_subscription_id"></a> [tooling\_subscription\_id](#input\_tooling\_subscription\_id) | The ID for the Tooling subscription that houses the Container Registry | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_insights_connection_string"></a> [app\_insights\_connection\_string](#output\_app\_insights\_connection\_string) | The Application Insights connection string used to allow monitoring on App Services |
| <a name="output_app_insights_instrumentation_key"></a> [app\_insights\_instrumentation\_key](#output\_app\_insights\_instrumentation\_key) | The Application Insights instrumentation key used to allow monitoring on App Services |
| <a name="output_app_service_plan_id"></a> [app\_service\_plan\_id](#output\_app\_service\_plan\_id) | The id of the app service plan |
| <a name="output_applications_service_vpn_gateway_shared_key"></a> [applications\_service\_vpn\_gateway\_shared\_key](#output\_applications\_service\_vpn\_gateway\_shared\_key) | The applications service virtual network gateway shared key |
| <a name="output_common_resource_group_name"></a> [common\_resource\_group\_name](#output\_common\_resource\_group\_name) | The name of the common infrastructure resource group |
| <a name="output_common_vnet_cidr_blocks"></a> [common\_vnet\_cidr\_blocks](#output\_common\_vnet\_cidr\_blocks) | A map of IP address blocks from the subnet name to the allocated CIDR prefix |
| <a name="output_common_vnet_gateway_id"></a> [common\_vnet\_gateway\_id](#output\_common\_vnet\_gateway\_id) | The id of the common infrastructure virtual network gateway |
| <a name="output_common_vnet_name"></a> [common\_vnet\_name](#output\_common\_vnet\_name) | The name of the common infrastructure virtual network |
| <a name="output_integration_subnet_id"></a> [integration\_subnet\_id](#output\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic |
| <a name="output_key_vault_secret_refs"></a> [key\_vault\_secret\_refs](#output\_key\_vault\_secret\_refs) | Map of secret references from the Key Vault |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
