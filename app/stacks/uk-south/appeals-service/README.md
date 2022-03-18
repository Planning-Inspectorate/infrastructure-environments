# Appeals service

This component contains the infrastructure required for the appeals service. This includes App services, CosmosDB, and the required networking resources.

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
| <a name="module_app_services"></a> [app\_services](#module\_app\_services) | ../../../components/appeals-app-services | n/a |
| <a name="module_azure_region_primary"></a> [azure\_region\_primary](#module\_azure\_region\_primary) | claranet/regions/azurerm | 4.2.1 |
| <a name="module_azure_region_secondary"></a> [azure\_region\_secondary](#module\_azure\_region\_secondary) | claranet/regions/azurerm | 4.2.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_advanced_threat_protection.appeal_documents](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/advanced_threat_protection) | resource |
| [azurerm_cosmosdb_account.appeals_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [azurerm_private_endpoint.cosmosdb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_resource_group.appeals_service_stack](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.appeal_documents](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account.function_apps](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.documents](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_subnet.appeals_service_ingress](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/container_registry) | data source |
| [azurerm_private_dns_zone.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.cosmosdb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_insights_connection_string"></a> [app\_insights\_connection\_string](#input\_app\_insights\_connection\_string) | The connection string to connect to an Application Insights resource | `string` | n/a | yes |
| <a name="input_app_insights_instrumentation_key"></a> [app\_insights\_instrumentation\_key](#input\_app\_insights\_instrumentation\_key) | The instrumentation key to connect to an Application Insights resource | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
| <a name="input_appeals_service_public_url"></a> [appeals\_service\_public\_url](#input\_appeals\_service\_public\_url) | The public URL for the Appeals Service frontend web app | `string` | n/a | yes |
| <a name="input_common_resource_group_name"></a> [common\_resource\_group\_name](#input\_common\_resource\_group\_name) | The common infrastructure resource group name | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common resource tags for the project | `map(string)` | n/a | yes |
| <a name="input_common_vnet_cidr_blocks"></a> [common\_vnet\_cidr\_blocks](#input\_common\_vnet\_cidr\_blocks) | A map of IP address blocks from the subnet name to the allocated CIDR prefix | `map(string)` | n/a | yes |
| <a name="input_common_vnet_name"></a> [common\_vnet\_name](#input\_common\_vnet\_name) | The common infrastructure virtual network name | `string` | n/a | yes |
| <a name="input_container_registry_name"></a> [container\_registry\_name](#input\_container\_registry\_name) | The name of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_container_registry_rg"></a> [container\_registry\_rg](#input\_container\_registry\_rg) | The resource group of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_instance"></a> [instance](#input\_instance) | The environment instance for use if multiple environments are deployed to a subscription | `string` | `"001"` | no |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string` | n/a | yes |
| <a name="input_key_vault_secret_refs"></a> [key\_vault\_secret\_refs](#input\_key\_vault\_secret\_refs) | Map of secret references from the Key Vault | `map(string)` | n/a | yes |
| <a name="input_logger_level"></a> [logger\_level](#input\_logger\_level) | The level of logging enabled for applications in the environment e.g. info | `string` | `"info"` | no |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string` | `"development"` | no |
| <a name="input_primary_cosmosdb_subnet_id"></a> [primary\_cosmosdb\_subnet\_id](#input\_primary\_cosmosdb\_subnet\_id) | The ID of the VNet in the primary location | `string` | n/a | yes |
| <a name="input_primary_location"></a> [primary\_location](#input\_primary\_location) | The primary location resources are deployed to in slug format e.g. 'uk-south' | `string` | `"uk-south"` | no |
| <a name="input_secondary_cosmosdb_subnet_id"></a> [secondary\_cosmosdb\_subnet\_id](#input\_secondary\_cosmosdb\_subnet\_id) | The ID of the VNet in the secondary location | `string` | n/a | yes |
| <a name="input_secondary_location"></a> [secondary\_location](#input\_secondary\_location) | The secondary location resources are deployed to in slug format e.g. 'uk-west' | `string` | `"uk-west"` | no |
| <a name="input_srv_notify_appeal_submission_confirmation_email_to_apellant_template_id"></a> [srv\_notify\_appeal\_submission\_confirmation\_email\_to\_apellant\_template\_id](#input\_srv\_notify\_appeal\_submission\_confirmation\_email\_to\_apellant\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_srv_notify_appeal_submission_received_notification_email_to_lpa_template_id"></a> [srv\_notify\_appeal\_submission\_received\_notification\_email\_to\_lpa\_template\_id](#input\_srv\_notify\_appeal\_submission\_received\_notification\_email\_to\_lpa\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_srv_notify_base_url"></a> [srv\_notify\_base\_url](#input\_srv\_notify\_base\_url) | The base URL for the Notifications service | `string` | n/a | yes |
| <a name="input_srv_notify_email_reply_to_id_start_email_to_lpa_template_id"></a> [srv\_notify\_email\_reply\_to\_id\_start\_email\_to\_lpa\_template\_id](#input\_srv\_notify\_email\_reply\_to\_id\_start\_email\_to\_lpa\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_srv_notify_service_id"></a> [srv\_notify\_service\_id](#input\_srv\_notify\_service\_id) | The ID of the Notifications service | `string` | n/a | yes |
| <a name="input_srv_notify_start_email_to_lpa_template_id"></a> [srv\_notify\_start\_email\_to\_lpa\_template\_id](#input\_srv\_notify\_start\_email\_to\_lpa\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_srv_notify_template_id"></a> [srv\_notify\_template\_id](#input\_srv\_notify\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_tooling_subscription_id"></a> [tooling\_subscription\_id](#input\_tooling\_subscription\_id) | The ID for the Tooling subscription that houses the Container Registry | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_urls"></a> [app\_service\_urls](#output\_app\_service\_urls) | A map of frontend app service URLs |
| <a name="output_cosmosdb_connection_string"></a> [cosmosdb\_connection\_string](#output\_cosmosdb\_connection\_string) | The connection string used to connect to the MongoDB |
| <a name="output_cosmosdb_id"></a> [cosmosdb\_id](#output\_cosmosdb\_id) | The ID of the Cosmos DB account |
| <a name="output_function_apps_storage_account"></a> [function\_apps\_storage\_account](#output\_function\_apps\_storage\_account) | The name of the storage account used by the Function Apps |
| <a name="output_function_apps_storage_account_primary_access_key"></a> [function\_apps\_storage\_account\_primary\_access\_key](#output\_function\_apps\_storage\_account\_primary\_access\_key) | The access key of the storage account used by the Function Apps |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
