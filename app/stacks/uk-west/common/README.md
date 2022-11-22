# Common infrastructure

This component contains the common infrastructure required by each environment. This component is required by various other components in each environment. For example, the App service plan.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.1.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_services"></a> [app\_services](#module\_app\_services) | ../../../modules/clamav-app-service | n/a |
| <a name="module_azure_region_ukw"></a> [azure\_region\_ukw](#module\_azure\_region\_ukw) | claranet/regions/azurerm | 4.2.1 |
| <a name="module_networking"></a> [networking](#module\_networking) | ../../../components/networking | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.environment_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.admins](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.frontdoor](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.pipeline_appeals_service](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.pipeline_applications_service](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.pipeline_back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.terraform](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_secret.applications_service_vpn_gateway_shared_key](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/key_vault_secret) | resource |
| [azurerm_log_analytics_workspace.common](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_action_group.low](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/monitor_action_group) | resource |
| [azurerm_resource_group.common_infrastructure](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/resource_group) | resource |
| [azurerm_service_plan.common_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/service_plan) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/data-sources/client_config) | data source |
| [azurerm_key_vault_secret.applications_service_vpn_gateway_shared_key](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/data-sources/key_vault_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_recipients"></a> [alert\_recipients](#input\_alert\_recipients) | The email recipients for monitoring alerts | `map(list(string))` | n/a | yes |
| <a name="input_app_service_plan_sku"></a> [app\_service\_plan\_sku](#input\_app\_service\_plan\_sku) | The SKU of the App Service Plan | `string` | `"P1v2"` | no |
| <a name="input_app_service_principal_id"></a> [app\_service\_principal\_id](#input\_app\_service\_principal\_id) | The ID of the service principal associated with App Service in the tenant | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common resource tags for the project | `map(string)` | n/a | yes |
| <a name="input_cosmosdb_enable_public_access"></a> [cosmosdb\_enable\_public\_access](#input\_cosmosdb\_enable\_public\_access) | A flag to indicate if the database can be accessed over the internet | `string` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_front_door_principal_id"></a> [front\_door\_principal\_id](#input\_front\_door\_principal\_id) | The ID of the service principal associated with Front Door in the tenant | `string` | n/a | yes |
| <a name="input_instance"></a> [instance](#input\_instance) | The environment instance for use if multiple environments are deployed to a subscription | `string` | `"001"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location resources are deployed to in slug format e.g. 'uk-south' | `string` | `"uk-west"` | no |
| <a name="input_pipeline_appeals_service_principal_object_id"></a> [pipeline\_appeals\_service\_principal\_object\_id](#input\_pipeline\_appeals\_service\_principal\_object\_id) | The ID of the service principal associated with the Appeals Service pipelines | `string` | n/a | yes |
| <a name="input_pipeline_applications_service_principal_object_id"></a> [pipeline\_applications\_service\_principal\_object\_id](#input\_pipeline\_applications\_service\_principal\_object\_id) | The ID of the service principal associated with the Applications Service pipelines | `string` | n/a | yes |
| <a name="input_pipeline_back_office_principal_object_id"></a> [pipeline\_back\_office\_principal\_object\_id](#input\_pipeline\_back\_office\_principal\_object\_id) | The ID of the service principal associated with the Back Office pipelines | `string` | n/a | yes |
| <a name="input_primary_vnet_address_space"></a> [primary\_vnet\_address\_space](#input\_primary\_vnet\_address\_space) | The CIDR address space for the common virtual network | `string` | n/a | yes |
| <a name="input_tooling_network_name"></a> [tooling\_network\_name](#input\_tooling\_network\_name) | The name of the VNet in the Tooling environment | `string` | n/a | yes |
| <a name="input_tooling_network_region_short"></a> [tooling\_network\_region\_short](#input\_tooling\_network\_region\_short) | The region in which the Tooling VNet resides in short format e.g. 'uks' | `string` | n/a | yes |
| <a name="input_tooling_network_rg"></a> [tooling\_network\_rg](#input\_tooling\_network\_rg) | The name of the resource group containing the VNet in the Tooling environment | `string` | n/a | yes |
| <a name="input_tooling_subscription_id"></a> [tooling\_subscription\_id](#input\_tooling\_subscription\_id) | The ID for the Tooling subscription that houses the Container Registry | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_action_group_low_id"></a> [action\_group\_low\_id](#output\_action\_group\_low\_id) | The Action Group ID for sending low priority (P4) alerts |
| <a name="output_app_service_plan_id"></a> [app\_service\_plan\_id](#output\_app\_service\_plan\_id) | The id of the app service plan |
| <a name="output_applications_service_vpn_gateway_shared_key"></a> [applications\_service\_vpn\_gateway\_shared\_key](#output\_applications\_service\_vpn\_gateway\_shared\_key) | The applications service virtual network gateway shared key |
| <a name="output_common_resource_group_name"></a> [common\_resource\_group\_name](#output\_common\_resource\_group\_name) | The name of the common infrastructure resource group |
| <a name="output_common_vnet_cidr_blocks"></a> [common\_vnet\_cidr\_blocks](#output\_common\_vnet\_cidr\_blocks) | A map of IP address blocks from the subnet name to the allocated CIDR prefix |
| <a name="output_common_vnet_gateway_id"></a> [common\_vnet\_gateway\_id](#output\_common\_vnet\_gateway\_id) | The id of the common infrastructure virtual network gateway |
| <a name="output_common_vnet_name"></a> [common\_vnet\_name](#output\_common\_vnet\_name) | The name of the common infrastructure virtual network |
| <a name="output_cosmosdb_subnet_id"></a> [cosmosdb\_subnet\_id](#output\_cosmosdb\_subnet\_id) | The id of the Cosmos DB endpoint subnet |
| <a name="output_integration_subnet_id"></a> [integration\_subnet\_id](#output\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | The ID of the key vault so App Services can pull secret values |
| <a name="output_key_vault_uri"></a> [key\_vault\_uri](#output\_key\_vault\_uri) | The URI of the Key Vault |
| <a name="output_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#output\_log\_analytics\_workspace\_id) | The ID of the Log Analytics Workspace so Front Door can log WAF events |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The ID of the Virtual Network |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
