# Back Office

This component contains the infrastructure required for the back office service. This includes frontend and backend App Services and Azure SQL.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |
| <a name="provider_azurerm.tooling"></a> [azurerm.tooling](#provider\_azurerm.tooling) | 3.0.2 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_services"></a> [app\_services](#module\_app\_services) | ../../../components/back-office-app-services | n/a |
| <a name="module_azure_region_ukw"></a> [azure\_region\_ukw](#module\_azure\_region\_ukw) | claranet/regions/azurerm | 4.2.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.back_office_sql_server_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_sql_server_username](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_mssql_database.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_mssql_server.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server_extended_auditing_policy.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_private_endpoint.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_resource_group.back_office_stack](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.sql_audit](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_subnet.back_office_ingress](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [random_id.username_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_password.back_office_sql_server_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/container_registry) | data source |
| [azurerm_private_dns_zone.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_low_id"></a> [action\_group\_low\_id](#input\_action\_group\_low\_id) | The ID of the Azure Monitor action group for low priority (P4) alerts | `string` | n/a | yes |
| <a name="input_app_insights_connection_string"></a> [app\_insights\_connection\_string](#input\_app\_insights\_connection\_string) | The connection string to connect to an Application Insights resource | `string` | n/a | yes |
| <a name="input_app_insights_instrumentation_key"></a> [app\_insights\_instrumentation\_key](#input\_app\_insights\_instrumentation\_key) | The instrumentation key to connect to an Application Insights resource | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
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
| <a name="input_location"></a> [location](#input\_location) | The location resources are deployed to in slug format e.g. 'uk-south' | `string` | `"uk-west"` | no |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool` | `false` | no |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string` | `"development"` | no |
| <a name="input_sql_database_configuration"></a> [sql\_database\_configuration](#input\_sql\_database\_configuration) | A map of database configuration options | `map(string)` | n/a | yes |
| <a name="input_sql_server_azuread_administrator"></a> [sql\_server\_azuread\_administrator](#input\_sql\_server\_azuread\_administrator) | A map describing the AzureAD account used for the SQL server administrator | `map(string)` | n/a | yes |
| <a name="input_tooling_subscription_id"></a> [tooling\_subscription\_id](#input\_tooling\_subscription\_id) | The ID for the Tooling subscription that houses the Container Registry | `string` | n/a | yes |
| <a name="input_use_deployment_slots"></a> [use\_deployment\_slots](#input\_use\_deployment\_slots) | Flag to indicate if App Service deployment slots are in use on the environment | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_back_office_sql_database"></a> [back\_office\_sql\_database](#output\_back\_office\_sql\_database) | The ID of the Back Office SQL database |
| <a name="output_sql_server_id"></a> [sql\_server\_id](#output\_sql\_server\_id) | The ID of the Back Office SQL server |
| <a name="output_sql_server_password"></a> [sql\_server\_password](#output\_sql\_server\_password) | The SQL server administrator password |
| <a name="output_sql_server_username"></a> [sql\_server\_username](#output\_sql\_server\_username) | The SQL server administrator username |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
