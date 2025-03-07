# Back Office

This component contains the infrastructure required for the back office service. This includes frontend and backend App Services and Azure SQL.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7, < 1.12.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.107.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.107.0 |
| <a name="provider_azurerm.tooling"></a> [azurerm.tooling](#provider\_azurerm.tooling) | 3.107.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_services"></a> [app\_services](#module\_app\_services) | ../../../components/back-office-app-services | n/a |
| <a name="module_apply_blob_container_legal_hold"></a> [apply\_blob\_container\_legal\_hold](#module\_apply\_blob\_container\_legal\_hold) | ../../../components/apply-blob-container-legal-hold | n/a |
| <a name="module_azure_region_ukw"></a> [azure\_region\_ukw](#module\_azure\_region\_ukw) | claranet/regions/azurerm | 4.2.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_advanced_threat_protection.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/advanced_threat_protection) | resource |
| [azurerm_app_configuration.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/app_configuration) | resource |
| [azurerm_app_configuration_feature.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/app_configuration_feature) | resource |
| [azurerm_application_insights.back_office_app_insights](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/application_insights) | resource |
| [azurerm_eventgrid_system_topic.back_office_documents_system_topic](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/eventgrid_system_topic) | resource |
| [azurerm_eventgrid_topic.malware_scanning_topic](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/eventgrid_topic) | resource |
| [azurerm_key_vault_secret.app_secret](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_applications_api_key_function](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_applications_api_key_swagger](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_applications_api_key_web](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_applications_redis_cache_connection_string_secret](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_sql_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_sql_connection_string_app](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_sql_server_password](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_sql_server_password_app](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_sql_server_username](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.back_office_sql_server_username_app](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.bo_app_config_connection_kv_secret](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.bo_app_insights_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_secret) | resource |
| [azurerm_log_analytics_workspace.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_diagnostic_setting.back_office_sql_database](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_metric_alert.back_office_sql_db_cpu_alert](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.back_office_sql_db_deadlock_alert](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.back_office_sql_db_dtu_alert](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.back_office_sql_db_log_io_alert](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.sb_dead_letter_alerts](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/monitor_metric_alert) | resource |
| [azurerm_mssql_database.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/mssql_database) | resource |
| [azurerm_mssql_database_extended_auditing_policy.back_office_sql_database](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/mssql_database_extended_auditing_policy) | resource |
| [azurerm_mssql_server.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server_extended_auditing_policy.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_mssql_server_security_alert_policy.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/mssql_server_security_alert_policy) | resource |
| [azurerm_mssql_server_vulnerability_assessment.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/mssql_server_vulnerability_assessment) | resource |
| [azurerm_private_endpoint.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.back_office_app_config](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.back_office_applications_redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/private_endpoint) | resource |
| [azurerm_redis_cache.back_office_applications_redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/redis_cache) | resource |
| [azurerm_resource_group.back_office_stack](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.back_office_app_configuration_terraform](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_servicebus_namespace.back_office](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_namespace) | resource |
| [azurerm_servicebus_topic.deadline_submission_result](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.deadline_submission_topic](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.folders](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.nsip_documents](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.nsip_exam_timetable](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.nsip_project](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.nsip_project_update](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.nsip_representation](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.nsip_s51_advice](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.nsip_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.register_nsip_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.register_representation](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic.service_user](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_topic) | resource |
| [azurerm_storage_account.back_office_documents](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/storage_account) | resource |
| [azurerm_storage_account.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/storage_account) | resource |
| [azurerm_storage_account.function_storage](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.back_office_document_service_uploads_container](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/storage_container) | resource |
| [azurerm_storage_container.back_office_published_documents_container](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/storage_container) | resource |
| [azurerm_storage_container.back_office_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/storage_container) | resource |
| [azurerm_storage_container.back_office_submissions_container](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/storage_container) | resource |
| [azurerm_subnet.back_office_ingress](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/subnet) | resource |
| [random_id.username_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_id.username_suffix_app](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_password.back_office_sql_server_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.back_office_sql_server_password_app](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/client_config) | data source |
| [azurerm_monitor_action_group.bo_applications_tech](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/monitor_action_group) | data source |
| [azurerm_private_dns_zone.app_config](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.database](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.service_bus](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.sql_synapse](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/private_dns_zone) | data source |
| [terraform_remote_state.odw](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_ids"></a> [action\_group\_ids](#input\_action\_group\_ids) | The IDs of the Azure Monitor action groups for different alert types | <pre>object({<br>    bo_applications_tech            = string,<br>    bo_applications_service_manager = string,<br>    iap                             = string,<br>    its                             = string,<br>    info_sec                        = string<br>  })</pre> | n/a | yes |
| <a name="input_action_group_ids_map"></a> [action\_group\_ids\_map](#input\_action\_group\_ids\_map) | All the Azure Monitor action group IDs | `map(string)` | n/a | yes |
| <a name="input_action_group_names"></a> [action\_group\_names](#input\_action\_group\_names) | The names of the Azure Monitor action groups for different alert types | <pre>object({<br>    bo_applications_tech            = string,<br>    bo_applications_service_manager = string,<br>    iap                             = string,<br>    its                             = string,<br>    info_sec                        = string<br>  })</pre> | n/a | yes |
| <a name="input_api_key_vault_authorization_enabled"></a> [api\_key\_vault\_authorization\_enabled](#input\_api\_key\_vault\_authorization\_enabled) | Whether or not Key Vault is used to access secrets from the app | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
| <a name="input_applications_front_office_web_url"></a> [applications\_front\_office\_web\_url](#input\_applications\_front\_office\_web\_url) | Applications Front Office Web URL | `string` | n/a | yes |
| <a name="input_azuread_applications_case_admin_officer_group_id"></a> [azuread\_applications\_case\_admin\_officer\_group\_id](#input\_azuread\_applications\_case\_admin\_officer\_group\_id) | The Azure AD group ID for Applications Back Office case admin officers | `string` | `null` | no |
| <a name="input_azuread_applications_caseteam_group_id"></a> [azuread\_applications\_caseteam\_group\_id](#input\_azuread\_applications\_caseteam\_group\_id) | The Azure AD group ID for Applications Back Office case team | `string` | `null` | no |
| <a name="input_azuread_applications_inspector_group_id"></a> [azuread\_applications\_inspector\_group\_id](#input\_azuread\_applications\_inspector\_group\_id) | The Azure AD group ID for Applications Back Office inspectors | `string` | `null` | no |
| <a name="input_azuread_auth_client_id"></a> [azuread\_auth\_client\_id](#input\_azuread\_auth\_client\_id) | The Back Office web frontend app registration ID used for Azure AD authentication | `string` | `null` | no |
| <a name="input_back_office_applications_log_level_file"></a> [back\_office\_applications\_log\_level\_file](#input\_back\_office\_applications\_log\_level\_file) | Log level for the server.log file - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_applications_log_level_stdout"></a> [back\_office\_applications\_log\_level\_stdout](#input\_back\_office\_applications\_log\_level\_stdout) | Log level for stdout - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_feature_flags"></a> [back\_office\_feature\_flags](#input\_back\_office\_feature\_flags) | A list of maps describing feature flags to be saved in the App Configuration store | `list(any)` | n/a | yes |
| <a name="input_back_office_integration_subnet_id"></a> [back\_office\_integration\_subnet\_id](#input\_back\_office\_integration\_subnet\_id) | Integration subnet for back office anti-virus resources | `string` | n/a | yes |
| <a name="input_back_office_public_url"></a> [back\_office\_public\_url](#input\_back\_office\_public\_url) | The public URL for the Back Office frontend web app | `string` | n/a | yes |
| <a name="input_back_office_public_url_new"></a> [back\_office\_public\_url\_new](#input\_back\_office\_public\_url\_new) | The new public URL for the Back Office frontend web app | `string` | `null` | no |
| <a name="input_back_office_published_documents_domain"></a> [back\_office\_published\_documents\_domain](#input\_back\_office\_published\_documents\_domain) | Domain for published documents | `string` | n/a | yes |
| <a name="input_common_resource_group_name"></a> [common\_resource\_group\_name](#input\_common\_resource\_group\_name) | The common infrastructure resource group name | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common resource tags for the project | `map(string)` | n/a | yes |
| <a name="input_common_vnet_cidr_blocks"></a> [common\_vnet\_cidr\_blocks](#input\_common\_vnet\_cidr\_blocks) | A map of IP address blocks from the subnet name to the allocated CIDR prefix | `map(string)` | n/a | yes |
| <a name="input_common_vnet_name"></a> [common\_vnet\_name](#input\_common\_vnet\_name) | The common infrastructure virtual network name | `string` | n/a | yes |
| <a name="input_container_registry_name"></a> [container\_registry\_name](#input\_container\_registry\_name) | The name of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_container_registry_rg"></a> [container\_registry\_rg](#input\_container\_registry\_rg) | The resource group of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_database_public_access_enabled"></a> [database\_public\_access\_enabled](#input\_database\_public\_access\_enabled) | A switch indicating if databases should have public access enabled | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_feature_service_bus_enabled"></a> [feature\_service\_bus\_enabled](#input\_feature\_service\_bus\_enabled) | Whether or not Service Bus events are enabled | `string` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | The path of the service's health check endpoint | `string` | `"/health"` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | The environment instance for use if multiple environments are deployed to a subscription | `string` | `"001"` | no |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string` | n/a | yes |
| <a name="input_key_vault_uri"></a> [key\_vault\_uri](#input\_key\_vault\_uri) | The URI of the Key Vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location resources are deployed to in slug format e.g. 'uk-south' | `string` | `"uk-west"` | no |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool` | `false` | no |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string` | `"development"` | no |
| <a name="input_notify_subscribers_function_gov_notify_template_id"></a> [notify\_subscribers\_function\_gov\_notify\_template\_id](#input\_notify\_subscribers\_function\_gov\_notify\_template\_id) | Notify Subscribers Function - GovNotify Template ID | `string` | n/a | yes |
| <a name="input_notify_subscribers_function_gov_notify_template_welsh_id"></a> [notify\_subscribers\_function\_gov\_notify\_template\_welsh\_id](#input\_notify\_subscribers\_function\_gov\_notify\_template\_welsh\_id) | Notify Subscribers Function - GovNotify Welsh Template ID | `string` | n/a | yes |
| <a name="input_odw_synapse_integration_enabled"></a> [odw\_synapse\_integration\_enabled](#input\_odw\_synapse\_integration\_enabled) | Whether or not Synapse Migration Integration is enabled | `bool` | `false` | no |
| <a name="input_private_endpoint_enabled"></a> [private\_endpoint\_enabled](#input\_private\_endpoint\_enabled) | A switch to determine if Private Endpoint should be enabled for backend App Services | `bool` | `true` | no |
| <a name="input_redis_cache_configuration"></a> [redis\_cache\_configuration](#input\_redis\_cache\_configuration) | A map of redis configuration options | `map(string)` | n/a | yes |
| <a name="input_sb_topic_names"></a> [sb\_topic\_names](#input\_sb\_topic\_names) | service bus topic names | <pre>object({<br>    common = object({ service_user = string }),<br>    applications = object({<br>      commands = object({<br>        register_nsip_subscription = string<br>        register_representation    = string<br>        deadline_submission_topic  = string<br>        deadline_submission_result = string<br>      })<br>      events = object({<br>        nsip_project        = string<br>        nsip_project_update = string<br>        nsip_documents      = string<br>        folders             = string<br>        nsip_subscription   = string<br>        nsip_exam_timetable = string<br>        nsip_representation = string<br>        nsip_s51_advice     = string<br>      })<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_service_bus_config"></a> [service\_bus\_config](#input\_service\_bus\_config) | service bus configuration | <pre>object({<br>    default_topic_ttl            = string<br>    bo_internal_subscription_ttl = string<br>    bo_subscription_ttl          = string<br>    fo_subscription_ttl          = string<br>  })</pre> | n/a | yes |
| <a name="input_service_bus_failover_enabled"></a> [service\_bus\_failover\_enabled](#input\_service\_bus\_failover\_enabled) | A switch to determine if Service Bus failover is enabled requiring the Premium SKU | `bool` | `false` | no |
| <a name="input_sql_database_configuration"></a> [sql\_database\_configuration](#input\_sql\_database\_configuration) | A map of database configuration options | `map(string)` | n/a | yes |
| <a name="input_sql_server_azuread_administrator"></a> [sql\_server\_azuread\_administrator](#input\_sql\_server\_azuread\_administrator) | A map describing the AzureAD account used for the SQL server administrator | `map(string)` | n/a | yes |
| <a name="input_tooling_subscription_id"></a> [tooling\_subscription\_id](#input\_tooling\_subscription\_id) | The ID for the Tooling subscription that houses the Container Registry | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_urls"></a> [app\_service\_urls](#output\_app\_service\_urls) | A map of frontend app service URLs |
| <a name="output_back_office_document_storage_account_name"></a> [back\_office\_document\_storage\_account\_name](#output\_back\_office\_document\_storage\_account\_name) | Name of the storage account used for back office documents |
| <a name="output_back_office_document_storage_api_host"></a> [back\_office\_document\_storage\_api\_host](#output\_back\_office\_document\_storage\_api\_host) | The full failover URI to the storage account used for back office documents |
| <a name="output_back_office_document_storage_container_name"></a> [back\_office\_document\_storage\_container\_name](#output\_back\_office\_document\_storage\_container\_name) | The back office blob storage container name |
| <a name="output_back_office_service_bus_connection_string"></a> [back\_office\_service\_bus\_connection\_string](#output\_back\_office\_service\_bus\_connection\_string) | Connection strong for Azure Service Bus in Back Office |
| <a name="output_back_office_sql_database"></a> [back\_office\_sql\_database](#output\_back\_office\_sql\_database) | The ID of the Back Office SQL database |
| <a name="output_back_office_submissions_storage_container_id"></a> [back\_office\_submissions\_storage\_container\_id](#output\_back\_office\_submissions\_storage\_container\_id) | Back office submissions container ID |
| <a name="output_back_office_submissions_storage_container_name"></a> [back\_office\_submissions\_storage\_container\_name](#output\_back\_office\_submissions\_storage\_container\_name) | Back office submissions container name |
| <a name="output_back_office_submissions_storage_container_resource_manager_id"></a> [back\_office\_submissions\_storage\_container\_resource\_manager\_id](#output\_back\_office\_submissions\_storage\_container\_resource\_manager\_id) | Back office submissions container resource\_manager\_id |
| <a name="output_bo_storage_account_id"></a> [bo\_storage\_account\_id](#output\_bo\_storage\_account\_id) | Back Office storage account id |
| <a name="output_document_check_function_storage_name"></a> [document\_check\_function\_storage\_name](#output\_document\_check\_function\_storage\_name) | Function Storage name |
| <a name="output_document_check_function_storage_primary_access_key"></a> [document\_check\_function\_storage\_primary\_access\_key](#output\_document\_check\_function\_storage\_primary\_access\_key) | Function Storage Primary Access Key |
| <a name="output_document_storage_back_office_document_service_uploads_container_id"></a> [document\_storage\_back\_office\_document\_service\_uploads\_container\_id](#output\_document\_storage\_back\_office\_document\_service\_uploads\_container\_id) | Back Office document-service-uploads container id |
| <a name="output_document_storage_back_office_document_service_uploads_container_name"></a> [document\_storage\_back\_office\_document\_service\_uploads\_container\_name](#output\_document\_storage\_back\_office\_document\_service\_uploads\_container\_name) | Back Office document-service-uploads container name |
| <a name="output_document_storage_back_office_document_service_uploads_container_resource_manager_id"></a> [document\_storage\_back\_office\_document\_service\_uploads\_container\_resource\_manager\_id](#output\_document\_storage\_back\_office\_document\_service\_uploads\_container\_resource\_manager\_id) | Back Office document-service-uploads container resource\_manager\_id |
| <a name="output_document_storage_back_office_published_documents_container_resource_manager_id"></a> [document\_storage\_back\_office\_published\_documents\_container\_resource\_manager\_id](#output\_document\_storage\_back\_office\_published\_documents\_container\_resource\_manager\_id) | Back Office published-documents container id |
| <a name="output_function_apps_storage_account"></a> [function\_apps\_storage\_account](#output\_function\_apps\_storage\_account) | Function app storage account |
| <a name="output_function_apps_storage_account_access_key"></a> [function\_apps\_storage\_account\_access\_key](#output\_function\_apps\_storage\_account\_access\_key) | Function app storage account access key |
| <a name="output_service_bus_namespace_id"></a> [service\_bus\_namespace\_id](#output\_service\_bus\_namespace\_id) | The ID of the Service Bus Namespace |
| <a name="output_service_bus_namespace_name"></a> [service\_bus\_namespace\_name](#output\_service\_bus\_namespace\_name) | The name of the Service Bus Namespace |
| <a name="output_service_bus_nsip_exam_timetable_id"></a> [service\_bus\_nsip\_exam\_timetable\_id](#output\_service\_bus\_nsip\_exam\_timetable\_id) | ID of the nsip-exam-timetable Service Bus Topic |
| <a name="output_service_bus_nsip_project_topic_id"></a> [service\_bus\_nsip\_project\_topic\_id](#output\_service\_bus\_nsip\_project\_topic\_id) | ID of the nsip-project Service Bus Topic |
| <a name="output_service_bus_nsip_project_update_topic_id"></a> [service\_bus\_nsip\_project\_update\_topic\_id](#output\_service\_bus\_nsip\_project\_update\_topic\_id) | ID of the nsip-project-update Service Bus Topic |
| <a name="output_service_bus_nsip_representation_id"></a> [service\_bus\_nsip\_representation\_id](#output\_service\_bus\_nsip\_representation\_id) | ID of the nsip-representation Service Bus Topic |
| <a name="output_service_bus_nsip_s51_advice_topic_id"></a> [service\_bus\_nsip\_s51\_advice\_topic\_id](#output\_service\_bus\_nsip\_s51\_advice\_topic\_id) | ID of the nsip-s51-advice Service Bus Topic |
| <a name="output_servicebus_topic_deadline_submission_result_id"></a> [servicebus\_topic\_deadline\_submission\_result\_id](#output\_servicebus\_topic\_deadline\_submission\_result\_id) | Service Bus Topic deadline\_submission\_result id |
| <a name="output_servicebus_topic_deadline_submission_topic_id"></a> [servicebus\_topic\_deadline\_submission\_topic\_id](#output\_servicebus\_topic\_deadline\_submission\_topic\_id) | Service Bus Topic deadline\_submission\_topic id |
| <a name="output_servicebus_topic_folders_id"></a> [servicebus\_topic\_folders\_id](#output\_servicebus\_topic\_folders\_id) | Service Bus Topic folder id |
| <a name="output_servicebus_topic_nsip_documents_id"></a> [servicebus\_topic\_nsip\_documents\_id](#output\_servicebus\_topic\_nsip\_documents\_id) | Service Bus Topic nsip-document id |
| <a name="output_servicebus_topic_register_nsip_subscription_id"></a> [servicebus\_topic\_register\_nsip\_subscription\_id](#output\_servicebus\_topic\_register\_nsip\_subscription\_id) | Service Bus Topic register\_nsip\_subscription id |
| <a name="output_servicebus_topic_register_representation_id"></a> [servicebus\_topic\_register\_representation\_id](#output\_servicebus\_topic\_register\_representation\_id) | Service Bus Topic register-representation id |
| <a name="output_servicebus_topic_service_user_id"></a> [servicebus\_topic\_service\_user\_id](#output\_servicebus\_topic\_service\_user\_id) | Service Bus Topic service-user id. Only used by ODW. |
| <a name="output_sql_server_id"></a> [sql\_server\_id](#output\_sql\_server\_id) | The ID of the Back Office SQL server |
| <a name="output_sql_server_password"></a> [sql\_server\_password](#output\_sql\_server\_password) | The SQL server administrator password |
| <a name="output_sql_server_username"></a> [sql\_server\_username](#output\_sql\_server\_username) | The SQL server administrator username |
| <a name="output_web_frontend_url"></a> [web\_frontend\_url](#output\_web\_frontend\_url) | The URL of the web frontend app service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
