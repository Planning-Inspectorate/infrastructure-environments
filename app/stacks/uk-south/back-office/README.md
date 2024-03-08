# Back Office

This component contains the infrastructure required for the back office service. This includes frontend and backend App Services and Azure SQL.

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
| <a name="provider_azurerm.tooling"></a> [azurerm.tooling](#provider\_azurerm.tooling) | 3.74.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_services"></a> [app\_services](#module\_app\_services) | ../../../components/back-office-app-services | n/a |
| <a name="module_azure_region_uks"></a> [azure\_region\_uks](#module\_azure\_region\_uks) | claranet/regions/azurerm | 4.2.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.back_office_appeals_redis_cache_connection_string_secret](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_applications_redis_cache_connection_string_secret](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/key_vault_secret) | resource |
| [azurerm_log_analytics_workspace.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/log_analytics_workspace) | resource |
| [azurerm_mssql_failover_group.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/mssql_failover_group) | resource |
| [azurerm_mssql_server.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server_extended_auditing_policy.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_mssql_server_security_alert_policy.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/mssql_server_security_alert_policy) | resource |
| [azurerm_mssql_server_vulnerability_assessment.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/mssql_server_vulnerability_assessment) | resource |
| [azurerm_private_dns_zone.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.back_office_appeals_redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.back_office_applications_redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/private_endpoint) | resource |
| [azurerm_redis_cache.back_office_appeals_redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/redis_cache) | resource |
| [azurerm_redis_cache.back_office_applications_redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/redis_cache) | resource |
| [azurerm_resource_group.back_office_stack](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/role_assignment) | resource |
| [azurerm_servicebus_namespace.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/servicebus_namespace) | resource |
| [azurerm_servicebus_namespace_disaster_recovery_config.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/servicebus_namespace_disaster_recovery_config) | resource |
| [azurerm_storage_account.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/storage_container) | resource |
| [azurerm_subnet.back_office_ingress](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/subnet) | resource |
| [azurerm_private_dns_zone.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.database](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/data-sources/private_dns_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_ids"></a> [action\_group\_ids](#input\_action\_group\_ids) | The IDs of the Azure Monitor action groups for different alert types | <pre>object({<br>    bo_appeals_tech                 = string,<br>    bo_appeals_service_manager      = string,<br>    bo_applications_tech            = string,<br>    bo_applications_service_manager = string,<br>    iap                             = string,<br>    its                             = string,<br>    info_sec                        = string<br>  })</pre> | n/a | yes |
| <a name="input_alert_recipients"></a> [alert\_recipients](#input\_alert\_recipients) | The email recipients for monitoring alerts | `map(list(string))` | n/a | yes |
| <a name="input_api_key_vault_authorization_enabled"></a> [api\_key\_vault\_authorization\_enabled](#input\_api\_key\_vault\_authorization\_enabled) | Whether or not Key Vault is used to access secrets from the app | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
| <a name="input_applications_front_office_web_url"></a> [applications\_front\_office\_web\_url](#input\_applications\_front\_office\_web\_url) | Applications Front Office Web URL | `string` | n/a | yes |
| <a name="input_azuread_appeals_case_officer_group_id"></a> [azuread\_appeals\_case\_officer\_group\_id](#input\_azuread\_appeals\_case\_officer\_group\_id) | The Azure AD group ID for Appeals Back Office case officers | `string` | `null` | no |
| <a name="input_azuread_appeals_cs_team_group_id"></a> [azuread\_appeals\_cs\_team\_group\_id](#input\_azuread\_appeals\_cs\_team\_group\_id) | The Azure AD group ID for Appeals Back Office CS Team | `string` | `null` | no |
| <a name="input_azuread_appeals_inspector_group_id"></a> [azuread\_appeals\_inspector\_group\_id](#input\_azuread\_appeals\_inspector\_group\_id) | The Azure AD group ID for Appeals Back Office inspectors | `string` | `null` | no |
| <a name="input_azuread_appeals_legal_team_group_id"></a> [azuread\_appeals\_legal\_team\_group\_id](#input\_azuread\_appeals\_legal\_team\_group\_id) | The Azure AD group ID for Appeals Back Office Legal Team | `string` | `null` | no |
| <a name="input_azuread_applications_case_admin_officer_group_id"></a> [azuread\_applications\_case\_admin\_officer\_group\_id](#input\_azuread\_applications\_case\_admin\_officer\_group\_id) | The Azure AD group ID for Applications Back Office case admin officers | `string` | `null` | no |
| <a name="input_azuread_applications_caseteam_group_id"></a> [azuread\_applications\_caseteam\_group\_id](#input\_azuread\_applications\_caseteam\_group\_id) | The Azure AD group ID for Applications Back Office case team | `string` | `null` | no |
| <a name="input_azuread_applications_inspector_group_id"></a> [azuread\_applications\_inspector\_group\_id](#input\_azuread\_applications\_inspector\_group\_id) | The Azure AD group ID for Applications Back Office inspectors | `string` | `null` | no |
| <a name="input_azuread_auth_client_id"></a> [azuread\_auth\_client\_id](#input\_azuread\_auth\_client\_id) | The Back Office web frontend app registration ID used for Azure AD authentication | `string` | `null` | no |
| <a name="input_back_office_appeals_log_level_file"></a> [back\_office\_appeals\_log\_level\_file](#input\_back\_office\_appeals\_log\_level\_file) | Log level for the server.log file - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_appeals_log_level_stdout"></a> [back\_office\_appeals\_log\_level\_stdout](#input\_back\_office\_appeals\_log\_level\_stdout) | Log level for stdout - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_appeals_public_url"></a> [back\_office\_appeals\_public\_url](#input\_back\_office\_appeals\_public\_url) | The public URL for the Back Office Appeals frontend web app | `string` | n/a | yes |
| <a name="input_back_office_appeals_sql_database"></a> [back\_office\_appeals\_sql\_database](#input\_back\_office\_appeals\_sql\_database) | The ID of the Back Office Appeals SQL database | `string` | n/a | yes |
| <a name="input_back_office_applications_log_level_file"></a> [back\_office\_applications\_log\_level\_file](#input\_back\_office\_applications\_log\_level\_file) | Log level for the server.log file - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_applications_log_level_stdout"></a> [back\_office\_applications\_log\_level\_stdout](#input\_back\_office\_applications\_log\_level\_stdout) | Log level for stdout - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_clamav_subnet_id"></a> [back\_office\_clamav\_subnet\_id](#input\_back\_office\_clamav\_subnet\_id) | Integration subnet for the clamav container | `string` | n/a | yes |
| <a name="input_back_office_document_storage_api_host"></a> [back\_office\_document\_storage\_api\_host](#input\_back\_office\_document\_storage\_api\_host) | The full failover URI to the storage account used for back office documents | `string` | n/a | yes |
| <a name="input_back_office_integration_subnet_id"></a> [back\_office\_integration\_subnet\_id](#input\_back\_office\_integration\_subnet\_id) | Integration subnet for back office anti-virus resources | `string` | n/a | yes |
| <a name="input_back_office_public_url"></a> [back\_office\_public\_url](#input\_back\_office\_public\_url) | The public URL for the Back Office frontend web app | `string` | n/a | yes |
| <a name="input_back_office_sql_database"></a> [back\_office\_sql\_database](#input\_back\_office\_sql\_database) | The ID of the Back Office SQL database | `string` | n/a | yes |
| <a name="input_common_resource_group_name"></a> [common\_resource\_group\_name](#input\_common\_resource\_group\_name) | The common infrastructure resource group name | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common resource tags for the project | `map(string)` | n/a | yes |
| <a name="input_common_vnet_cidr_blocks"></a> [common\_vnet\_cidr\_blocks](#input\_common\_vnet\_cidr\_blocks) | A map of IP address blocks from the subnet name to the allocated CIDR prefix | `map(string)` | n/a | yes |
| <a name="input_common_vnet_id"></a> [common\_vnet\_id](#input\_common\_vnet\_id) | The common infrastructure virtual network id | `string` | n/a | yes |
| <a name="input_common_vnet_name"></a> [common\_vnet\_name](#input\_common\_vnet\_name) | The common infrastructure virtual network name | `string` | n/a | yes |
| <a name="input_container_registry_name"></a> [container\_registry\_name](#input\_container\_registry\_name) | The name of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_container_registry_rg"></a> [container\_registry\_rg](#input\_container\_registry\_rg) | The resource group of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_database_public_access_enabled"></a> [database\_public\_access\_enabled](#input\_database\_public\_access\_enabled) | A switch indicating if databases should have public access enabled | `bool` | `false` | no |
| <a name="input_document_check_function_storage_name"></a> [document\_check\_function\_storage\_name](#input\_document\_check\_function\_storage\_name) | Function Storage name | `string` | n/a | yes |
| <a name="input_document_check_function_storage_primary_access_key"></a> [document\_check\_function\_storage\_primary\_access\_key](#input\_document\_check\_function\_storage\_primary\_access\_key) | Function Storage Primary Access Key | `string` | n/a | yes |
| <a name="input_document_storage_back_office_document_service_uploads_container_name"></a> [document\_storage\_back\_office\_document\_service\_uploads\_container\_name](#input\_document\_storage\_back\_office\_document\_service\_uploads\_container\_name) | Document Storage document service uploads container name | `string` | n/a | yes |
| <a name="input_document_storage_back_office_document_service_uploads_container_resource_manager_id"></a> [document\_storage\_back\_office\_document\_service\_uploads\_container\_resource\_manager\_id](#input\_document\_storage\_back\_office\_document\_service\_uploads\_container\_resource\_manager\_id) | Back Office document-service-uploads container resource\_manager\_id | `string` | n/a | yes |
| <a name="input_document_storage_back_office_published_documents_container_resource_manager_id"></a> [document\_storage\_back\_office\_published\_documents\_container\_resource\_manager\_id](#input\_document\_storage\_back\_office\_published\_documents\_container\_resource\_manager\_id) | Back Office published-documents container resource\_manager\_id | `string` | n/a | yes |
| <a name="input_document_storage_submissions_container_resource_manager_id"></a> [document\_storage\_submissions\_container\_resource\_manager\_id](#input\_document\_storage\_submissions\_container\_resource\_manager\_id) | Submissions container resource\_manager\_id | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_feature_service_bus_enabled"></a> [feature\_service\_bus\_enabled](#input\_feature\_service\_bus\_enabled) | Whether or not Service Bus events are enabled | `string` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | The path of the service's health check endpoint | `string` | `"/health"` | no |
| <a name="input_horizon_url"></a> [horizon\_url](#input\_horizon\_url) | The URL used to connect to Horizon | `string` | n/a | yes |
| <a name="input_instance"></a> [instance](#input\_instance) | The environment instance for use if multiple environments are deployed to a subscription | `string` | `"001"` | no |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string` | n/a | yes |
| <a name="input_is_dr_deployment"></a> [is\_dr\_deployment](#input\_is\_dr\_deployment) | A flag to indicate whether or not the infrastructure deployment is for a disaster recovery scenario | `bool` | `false` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string` | n/a | yes |
| <a name="input_key_vault_uri"></a> [key\_vault\_uri](#input\_key\_vault\_uri) | The URI of the Key Vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location resources are deployed to in slug format e.g. 'uk-south' | `string` | `"uk-south"` | no |
| <a name="input_mock_horizon"></a> [mock\_horizon](#input\_mock\_horizon) | Whether or not to mock Horizon | `bool` | n/a | yes |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool` | `false` | no |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string` | `"development"` | no |
| <a name="input_notify_subscribers_function_gov_notify_template_id"></a> [notify\_subscribers\_function\_gov\_notify\_template\_id](#input\_notify\_subscribers\_function\_gov\_notify\_template\_id) | Notify Subscribers Function - GovNotify Template ID | `string` | n/a | yes |
| <a name="input_primary_service_bus_namespace_id"></a> [primary\_service\_bus\_namespace\_id](#input\_primary\_service\_bus\_namespace\_id) | The ID of the primary Service Bus Namespace | `string` | n/a | yes |
| <a name="input_primary_sql_server_id"></a> [primary\_sql\_server\_id](#input\_primary\_sql\_server\_id) | The ID of the primary Back Office SQL server | `string` | n/a | yes |
| <a name="input_private_endpoint_enabled"></a> [private\_endpoint\_enabled](#input\_private\_endpoint\_enabled) | A switch to determine if Private Endpoint should be enabled for backend App Services | `bool` | `true` | no |
| <a name="input_redis_cache_configuration"></a> [redis\_cache\_configuration](#input\_redis\_cache\_configuration) | A map of redis configuration options | `map(string)` | n/a | yes |
| <a name="input_service_bus_config"></a> [service\_bus\_config](#input\_service\_bus\_config) | service bus configuration | <pre>object({<br>    default_topic_ttl            = string<br>    bo_internal_subscription_ttl = string<br>    bo_subscription_ttl          = string<br>    fo_subscription_ttl          = string<br>  })</pre> | n/a | yes |
| <a name="input_service_bus_failover_enabled"></a> [service\_bus\_failover\_enabled](#input\_service\_bus\_failover\_enabled) | A switch to determine if Service Bus failover is enabled requiring the Premium SKU | `bool` | `false` | no |
| <a name="input_servicebus_topic_nsip_documents_id"></a> [servicebus\_topic\_nsip\_documents\_id](#input\_servicebus\_topic\_nsip\_documents\_id) | Service Bus Topic nsip-document id | `string` | n/a | yes |
| <a name="input_sql_database_configuration"></a> [sql\_database\_configuration](#input\_sql\_database\_configuration) | A map of database configuration options | `map(string)` | n/a | yes |
| <a name="input_sql_server_azuread_administrator"></a> [sql\_server\_azuread\_administrator](#input\_sql\_server\_azuread\_administrator) | A map describing the AzureAD account used for the SQL server administrator | `map(string)` | n/a | yes |
| <a name="input_sql_server_password"></a> [sql\_server\_password](#input\_sql\_server\_password) | The SQL server administrator password | `string` | n/a | yes |
| <a name="input_sql_server_username"></a> [sql\_server\_username](#input\_sql\_server\_username) | The SQL server administrator username | `string` | n/a | yes |
| <a name="input_tooling_subscription_id"></a> [tooling\_subscription\_id](#input\_tooling\_subscription\_id) | The ID for the Tooling subscription that houses the Container Registry | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_urls"></a> [app\_service\_urls](#output\_app\_service\_urls) | A map of frontend app service URLs |
| <a name="output_appeals_web_frontend_url"></a> [appeals\_web\_frontend\_url](#output\_appeals\_web\_frontend\_url) | The URL of the appeals web frontend app service |
| <a name="output_web_frontend_url"></a> [web\_frontend\_url](#output\_web\_frontend\_url) | The URL of the web frontend app service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
