# Back Office App Services

This module contains the App Services resources for the Back Office service. These are placed in a sub-module as they need to be deployed to multiple Locations.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.107.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.107.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_service"></a> [app\_service](#module\_app\_service) | github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-app-service | 1.16 |
| <a name="module_applications_background_job_functions"></a> [applications\_background\_job\_functions](#module\_applications\_background\_job\_functions) | ./applications-background-job-functions | n/a |
| <a name="module_applications_command_handler_functions"></a> [applications\_command\_handler\_functions](#module\_applications\_command\_handler\_functions) | ./applications-command-handler-functions | n/a |
| <a name="module_applications_migration_function"></a> [applications\_migration\_function](#module\_applications\_migration\_function) | ./applications-migration-function | n/a |
| <a name="module_azure_region"></a> [azure\_region](#module\_azure\_region) | claranet/regions/azurerm | 4.2.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group_template_deployment.malware_scanning](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/resource_group_template_deployment) | resource |
| [azurerm_role_assignment.applications_case_admin_officer_documents_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.applications_caseteam_documents_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.applications_inspector_documents_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.back_office_app_send_event_grid](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.back_office_app_send_service_bus_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_service_plan.back_office_functions_plan](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/service_plan) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_ids"></a> [action\_group\_ids](#input\_action\_group\_ids) | The IDs of the Azure Monitor action groups for different alert types | <pre>object({<br>    bo_applications_tech            = string,<br>    bo_applications_service_manager = string,<br>    iap                             = string,<br>    its                             = string,<br>    info_sec                        = string<br>  })</pre> | n/a | yes |
| <a name="input_api_key_vault_authorization_enabled"></a> [api\_key\_vault\_authorization\_enabled](#input\_api\_key\_vault\_authorization\_enabled) | Whether or not Key Vault is used to access secrets from the app | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
| <a name="input_app_service_private_dns_zone_id"></a> [app\_service\_private\_dns\_zone\_id](#input\_app\_service\_private\_dns\_zone\_id) | The id of the private DNS zone for App services | `string` | n/a | yes |
| <a name="input_applications_front_office_web_url"></a> [applications\_front\_office\_web\_url](#input\_applications\_front\_office\_web\_url) | Applications Front Office Web URL | `string` | n/a | yes |
| <a name="input_azuread_applications_case_admin_officer_group_id"></a> [azuread\_applications\_case\_admin\_officer\_group\_id](#input\_azuread\_applications\_case\_admin\_officer\_group\_id) | The Azure AD group ID for Applications Back Office case admin officers | `string` | `null` | no |
| <a name="input_azuread_applications_caseteam_group_id"></a> [azuread\_applications\_caseteam\_group\_id](#input\_azuread\_applications\_caseteam\_group\_id) | The Azure AD group ID for Applications Back Office case team | `string` | `null` | no |
| <a name="input_azuread_applications_inspector_group_id"></a> [azuread\_applications\_inspector\_group\_id](#input\_azuread\_applications\_inspector\_group\_id) | The Azure AD group ID for Applications Back Office inspectors | `string` | `null` | no |
| <a name="input_azuread_auth_client_id"></a> [azuread\_auth\_client\_id](#input\_azuread\_auth\_client\_id) | The Back Office web frontend app registration ID used for Azure AD authentication | `string` | `null` | no |
| <a name="input_back_office_applications_log_level_file"></a> [back\_office\_applications\_log\_level\_file](#input\_back\_office\_applications\_log\_level\_file) | Log level for the server.log file - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_applications_log_level_stdout"></a> [back\_office\_applications\_log\_level\_stdout](#input\_back\_office\_applications\_log\_level\_stdout) | Log level for stdout - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_applications_redis_connection_string_secret_name"></a> [back\_office\_applications\_redis\_connection\_string\_secret\_name](#input\_back\_office\_applications\_redis\_connection\_string\_secret\_name) | The connection string (secret name) used to connect to the Back Office Applications Redis Cache | `string` | n/a | yes |
| <a name="input_back_office_hostname"></a> [back\_office\_hostname](#input\_back\_office\_hostname) | Back Office Hostname | `string` | n/a | yes |
| <a name="input_back_office_integration_subnet_id"></a> [back\_office\_integration\_subnet\_id](#input\_back\_office\_integration\_subnet\_id) | Integration subnet for back office anti-virus resources | `string` | n/a | yes |
| <a name="input_container_registry_name"></a> [container\_registry\_name](#input\_container\_registry\_name) | The name of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_container_registry_rg"></a> [container\_registry\_rg](#input\_container\_registry\_rg) | The resource group of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the Applications Back Office database | `string` | n/a | yes |
| <a name="input_deadline_submissions_result_topic_name"></a> [deadline\_submissions\_result\_topic\_name](#input\_deadline\_submissions\_result\_topic\_name) | Deadline Submissions Result Topic Name | `string` | n/a | yes |
| <a name="input_document_check_function_storage_name"></a> [document\_check\_function\_storage\_name](#input\_document\_check\_function\_storage\_name) | Function Storage name. NOTE: This is storage for all functions. | `string` | n/a | yes |
| <a name="input_document_check_function_storage_primary_access_key"></a> [document\_check\_function\_storage\_primary\_access\_key](#input\_document\_check\_function\_storage\_primary\_access\_key) | Function Storage Primary Access Key. NOTE: This is storage for all functions. | `string` | n/a | yes |
| <a name="input_document_storage_account_endpoint"></a> [document\_storage\_account\_endpoint](#input\_document\_storage\_account\_endpoint) | The primary blob endpoint for the storage account used for back office documents | `string` | n/a | yes |
| <a name="input_document_storage_account_name"></a> [document\_storage\_account\_name](#input\_document\_storage\_account\_name) | The ID of the storage account for back office documents | `string` | n/a | yes |
| <a name="input_document_storage_api_host"></a> [document\_storage\_api\_host](#input\_document\_storage\_api\_host) | The full URI to the storage account used for back office documents | `string` | n/a | yes |
| <a name="input_document_storage_back_office_document_service_uploads_container_name"></a> [document\_storage\_back\_office\_document\_service\_uploads\_container\_name](#input\_document\_storage\_back\_office\_document\_service\_uploads\_container\_name) | Document Storage document service uploads container name | `string` | n/a | yes |
| <a name="input_document_storage_back_office_document_service_uploads_container_resource_manager_id"></a> [document\_storage\_back\_office\_document\_service\_uploads\_container\_resource\_manager\_id](#input\_document\_storage\_back\_office\_document\_service\_uploads\_container\_resource\_manager\_id) | Back Office document-service-uploads container resource\_manager\_id | `string` | n/a | yes |
| <a name="input_document_storage_back_office_published_documents_container_resource_manager_id"></a> [document\_storage\_back\_office\_published\_documents\_container\_resource\_manager\_id](#input\_document\_storage\_back\_office\_published\_documents\_container\_resource\_manager\_id) | Back Office published-documents container resource\_manager\_id | `string` | n/a | yes |
| <a name="input_document_storage_submissions_container_resource_manager_id"></a> [document\_storage\_submissions\_container\_resource\_manager\_id](#input\_document\_storage\_submissions\_container\_resource\_manager\_id) | Submissions container resource\_manager\_id | `string` | n/a | yes |
| <a name="input_endpoint_subnet_id"></a> [endpoint\_subnet\_id](#input\_endpoint\_subnet\_id) | The id of the private endpoint subnet the app service is linked to for ingress traffic | `string` | n/a | yes |
| <a name="input_feature_service_bus_enabled"></a> [feature\_service\_bus\_enabled](#input\_feature\_service\_bus\_enabled) | Whether or not Service Bus events are enabled | `string` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | The path of the service's health check endpoint | `string` | `null` | no |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string` | n/a | yes |
| <a name="input_key_vault_uri"></a> [key\_vault\_uri](#input\_key\_vault\_uri) | The URI of the Key Vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location the App Services are deployed to in slug format e.g. 'uk-south' | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Azure Monitor Log Analytics Workspace | `string` | n/a | yes |
| <a name="input_malware_scanning_topic_id"></a> [malware\_scanning\_topic\_id](#input\_malware\_scanning\_topic\_id) | Event grid topic name for publishing malware scan results | `string` | n/a | yes |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool` | `false` | no |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string` | `"development"` | no |
| <a name="input_notify_subscribers_function_gov_notify_template_id"></a> [notify\_subscribers\_function\_gov\_notify\_template\_id](#input\_notify\_subscribers\_function\_gov\_notify\_template\_id) | Notify Subscribers Function - GovNotify Template ID | `string` | n/a | yes |
| <a name="input_notify_subscribers_function_gov_notify_template_welsh_id"></a> [notify\_subscribers\_function\_gov\_notify\_template\_welsh\_id](#input\_notify\_subscribers\_function\_gov\_notify\_template\_welsh\_id) | Notify Subscribers Function - GovNotify Welsh Template ID | `string` | n/a | yes |
| <a name="input_odw_data_lake_storage_account_id"></a> [odw\_data\_lake\_storage\_account\_id](#input\_odw\_data\_lake\_storage\_account\_id) | Storage Account ID for ODW Data Lake | `string` | `""` | no |
| <a name="input_odw_synapse_integration_enabled"></a> [odw\_synapse\_integration\_enabled](#input\_odw\_synapse\_integration\_enabled) | Whether or not Synapse Migration Integration is enabled | `bool` | `false` | no |
| <a name="input_odw_synapse_ssql_endpoint"></a> [odw\_synapse\_ssql\_endpoint](#input\_odw\_synapse\_ssql\_endpoint) | Serverless SQL Endpoint for ODW Synapse | `string` | `""` | no |
| <a name="input_private_endpoint_enabled"></a> [private\_endpoint\_enabled](#input\_private\_endpoint\_enabled) | A switch to determine if Private Endpoint should be enabled for backend App Services | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group that will contain the App Services | `string` | n/a | yes |
| <a name="input_resource_suffix"></a> [resource\_suffix](#input\_resource\_suffix) | The suffix for resource naming | `string` | n/a | yes |
| <a name="input_service_bus_config"></a> [service\_bus\_config](#input\_service\_bus\_config) | service bus configuration | <pre>object({<br>    default_topic_ttl            = string<br>    bo_internal_subscription_ttl = string<br>    bo_subscription_ttl          = string<br>    fo_subscription_ttl          = string<br>  })</pre> | n/a | yes |
| <a name="input_service_bus_namespace_id"></a> [service\_bus\_namespace\_id](#input\_service\_bus\_namespace\_id) | The ID of the Back Office service bus namespace | `string` | `null` | no |
| <a name="input_service_bus_namespace_name"></a> [service\_bus\_namespace\_name](#input\_service\_bus\_namespace\_name) | The name of the Back Office service bus namespace | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the service the Azure App Services are part of | `string` | n/a | yes |
| <a name="input_service_plan_sku"></a> [service\_plan\_sku](#input\_service\_plan\_sku) | The SKU of the App Service Plan providing resources to hosted App Services | `string` | `"P2v2"` | no |
| <a name="input_servicebus_topic_deadline_submission_result_id"></a> [servicebus\_topic\_deadline\_submission\_result\_id](#input\_servicebus\_topic\_deadline\_submission\_result\_id) | Service Bus Topic deadline-submission-result id | `string` | n/a | yes |
| <a name="input_servicebus_topic_deadline_submission_topic_id"></a> [servicebus\_topic\_deadline\_submission\_topic\_id](#input\_servicebus\_topic\_deadline\_submission\_topic\_id) | Service Bus Topic deadline-submission-topic id | `string` | n/a | yes |
| <a name="input_servicebus_topic_deadline_submission_topic_name"></a> [servicebus\_topic\_deadline\_submission\_topic\_name](#input\_servicebus\_topic\_deadline\_submission\_topic\_name) | Service Bus Topic deadline-submission-topic name | `string` | n/a | yes |
| <a name="input_servicebus_topic_nsip_documents_id"></a> [servicebus\_topic\_nsip\_documents\_id](#input\_servicebus\_topic\_nsip\_documents\_id) | Service Bus Topic nsip-document id | `string` | n/a | yes |
| <a name="input_servicebus_topic_nsip_project_update_id"></a> [servicebus\_topic\_nsip\_project\_update\_id](#input\_servicebus\_topic\_nsip\_project\_update\_id) | Service Bus Topic nsip-project-update id | `string` | n/a | yes |
| <a name="input_servicebus_topic_register_nsip_subscription_id"></a> [servicebus\_topic\_register\_nsip\_subscription\_id](#input\_servicebus\_topic\_register\_nsip\_subscription\_id) | Service Bus Topic register-nsip-subscription id | `string` | n/a | yes |
| <a name="input_servicebus_topic_register_representation_id"></a> [servicebus\_topic\_register\_representation\_id](#input\_servicebus\_topic\_register\_representation\_id) | Service Bus Topic register-representation id | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags applied to all resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_principal_ids"></a> [app\_service\_principal\_ids](#output\_app\_service\_principal\_ids) | A map of App Service principal IDs |
| <a name="output_app_service_urls"></a> [app\_service\_urls](#output\_app\_service\_urls) | A map of App Service URLs |
| <a name="output_secret_names"></a> [secret\_names](#output\_secret\_names) | List of Key Vault secrets required for this component |
| <a name="output_web_frontend_url"></a> [web\_frontend\_url](#output\_web\_frontend\_url) | The URL of the web frontend App Service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
