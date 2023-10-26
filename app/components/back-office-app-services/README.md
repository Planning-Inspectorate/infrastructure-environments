# Back Office App Services

This module contains the App Services resources for the Back Office service. These are placed in a sub-module as they need to be deployed to multiple Locations.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.74.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.74.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_service"></a> [app\_service](#module\_app\_service) | github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-app-service | 1.4 |
| <a name="module_applications_migration_function"></a> [applications\_migration\_function](#module\_applications\_migration\_function) | ./applications-migration-function | n/a |
| <a name="module_azure_region"></a> [azure\_region](#module\_azure\_region) | claranet/regions/azurerm | 4.2.1 |
| <a name="module_bo_appeals_casedata_import_function"></a> [bo\_appeals\_casedata\_import\_function](#module\_bo\_appeals\_casedata\_import\_function) | ./bo-appeals-casedata-import-function | n/a |
| <a name="module_bo_appeals_hrdata_import_function"></a> [bo\_appeals\_hrdata\_import\_function](#module\_bo\_appeals\_hrdata\_import\_function) | ./bo-appeals-hrdata-import-function | n/a |
| <a name="module_bo_appeals_lpaq_import_function"></a> [bo\_appeals\_lpaq\_import\_function](#module\_bo\_appeals\_lpaq\_import\_function) | ./bo-appeals-lpaq-import-function | n/a |
| <a name="module_clam_av_container"></a> [clam\_av\_container](#module\_clam\_av\_container) | ./clamav-container | n/a |
| <a name="module_deadline_submissions_function"></a> [deadline\_submissions\_function](#module\_deadline\_submissions\_function) | ./deadline-submissions-function | n/a |
| <a name="module_document_check_function"></a> [document\_check\_function](#module\_document\_check\_function) | ./document-check-function | n/a |
| <a name="module_handle_subscriptions_function"></a> [handle\_subscriptions\_function](#module\_handle\_subscriptions\_function) | ./handle-subscriptions-function | n/a |
| <a name="module_notify_subscribers_function"></a> [notify\_subscribers\_function](#module\_notify\_subscribers\_function) | ./notify-subscribers-function | n/a |
| <a name="module_odw_subscriber_function"></a> [odw\_subscriber\_function](#module\_odw\_subscriber\_function) | ./odw-subscriber-function | n/a |
| <a name="module_publish_document_function"></a> [publish\_document\_function](#module\_publish\_document\_function) | ./publish-document-function | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.appeals_case_officer_documents_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.appeals_inspector_documents_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.applications_case_admin_officer_documents_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.applications_caseteam_documents_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.back_office_app_send_service_bus_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.back_office_appeals_send_service_bus_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/role_assignment) | resource |
| [azurerm_service_plan.back_office_functions_plan](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/resources/service_plan) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.74.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_low_id"></a> [action\_group\_low\_id](#input\_action\_group\_low\_id) | The ID of the Azure Monitor action group for low priority alerts | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
| <a name="input_app_service_private_dns_zone_id"></a> [app\_service\_private\_dns\_zone\_id](#input\_app\_service\_private\_dns\_zone\_id) | The id of the private DNS zone for App services | `string` | n/a | yes |
| <a name="input_appeals_database_connection_string"></a> [appeals\_database\_connection\_string](#input\_appeals\_database\_connection\_string) | The connection string used to connect to the Back Office Appeals MySQL database | `string` | n/a | yes |
| <a name="input_applications_front_office_web_url"></a> [applications\_front\_office\_web\_url](#input\_applications\_front\_office\_web\_url) | Applications Front Office Web URL | `string` | n/a | yes |
| <a name="input_azuread_appeals_case_officer_group_id"></a> [azuread\_appeals\_case\_officer\_group\_id](#input\_azuread\_appeals\_case\_officer\_group\_id) | The Azure AD group ID for Appeals Back Office case officers | `string` | `null` | no |
| <a name="input_azuread_appeals_cs_team_group_id"></a> [azuread\_appeals\_cs\_team\_group\_id](#input\_azuread\_appeals\_cs\_team\_group\_id) | The Azure AD group ID for Appeals Back Office CS Team | `string` | `null` | no |
| <a name="input_azuread_appeals_inspector_group_id"></a> [azuread\_appeals\_inspector\_group\_id](#input\_azuread\_appeals\_inspector\_group\_id) | The Azure AD group ID for Appeals Back Office inspectors | `string` | `null` | no |
| <a name="input_azuread_appeals_legal_team_group_id"></a> [azuread\_appeals\_legal\_team\_group\_id](#input\_azuread\_appeals\_legal\_team\_group\_id) | The Azure AD group ID for Appeals Back Office Legal Team | `string` | `null` | no |
| <a name="input_azuread_applications_case_admin_officer_group_id"></a> [azuread\_applications\_case\_admin\_officer\_group\_id](#input\_azuread\_applications\_case\_admin\_officer\_group\_id) | The Azure AD group ID for Applications Back Office case admin officers | `string` | `null` | no |
| <a name="input_azuread_applications_caseteam_group_id"></a> [azuread\_applications\_caseteam\_group\_id](#input\_azuread\_applications\_caseteam\_group\_id) | The Azure AD group ID for Applications Back Office case team | `string` | `null` | no |
| <a name="input_azuread_applications_inspector_group_id"></a> [azuread\_applications\_inspector\_group\_id](#input\_azuread\_applications\_inspector\_group\_id) | The Azure AD group ID for Applications Back Office inspectors | `string` | `null` | no |
| <a name="input_azuread_auth_client_id"></a> [azuread\_auth\_client\_id](#input\_azuread\_auth\_client\_id) | The Back Office web frontend app registration ID used for Azure AD authentication | `string` | `null` | no |
| <a name="input_back_office_appeals_hostname"></a> [back\_office\_appeals\_hostname](#input\_back\_office\_appeals\_hostname) | Back Office Hostname | `string` | n/a | yes |
| <a name="input_back_office_appeals_log_level_file"></a> [back\_office\_appeals\_log\_level\_file](#input\_back\_office\_appeals\_log\_level\_file) | Log level for the server.log file - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_appeals_log_level_stdout"></a> [back\_office\_appeals\_log\_level\_stdout](#input\_back\_office\_appeals\_log\_level\_stdout) | Log level for stdout - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_appeals_redis_connection_string_secret_name"></a> [back\_office\_appeals\_redis\_connection\_string\_secret\_name](#input\_back\_office\_appeals\_redis\_connection\_string\_secret\_name) | The connection string (secret name) used to connect to the Back Office Appeals Redis Cache | `string` | n/a | yes |
| <a name="input_back_office_applications_log_level_file"></a> [back\_office\_applications\_log\_level\_file](#input\_back\_office\_applications\_log\_level\_file) | Log level for the server.log file - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_applications_log_level_stdout"></a> [back\_office\_applications\_log\_level\_stdout](#input\_back\_office\_applications\_log\_level\_stdout) | Log level for stdout - trace, debug, info, warn, error, fatal, silent | `string` | n/a | yes |
| <a name="input_back_office_applications_redis_connection_string_secret_name"></a> [back\_office\_applications\_redis\_connection\_string\_secret\_name](#input\_back\_office\_applications\_redis\_connection\_string\_secret\_name) | The connection string (secret name) used to connect to the Back Office Applications Redis Cache | `string` | n/a | yes |
| <a name="input_back_office_clamav_subnet_id"></a> [back\_office\_clamav\_subnet\_id](#input\_back\_office\_clamav\_subnet\_id) | Integration subnet for the clamav container | `string` | n/a | yes |
| <a name="input_back_office_documents_system_topic_name"></a> [back\_office\_documents\_system\_topic\_name](#input\_back\_office\_documents\_system\_topic\_name) | Back Office Document Storage System Topic Name | `string` | `""` | no |
| <a name="input_back_office_hostname"></a> [back\_office\_hostname](#input\_back\_office\_hostname) | Back Office Hostname | `string` | n/a | yes |
| <a name="input_back_office_integration_subnet_id"></a> [back\_office\_integration\_subnet\_id](#input\_back\_office\_integration\_subnet\_id) | Integration subnet for back office anti-virus resources | `string` | n/a | yes |
| <a name="input_common_vnet_id"></a> [common\_vnet\_id](#input\_common\_vnet\_id) | The common infrastructure virtual network id | `string` | n/a | yes |
| <a name="input_container_registry_name"></a> [container\_registry\_name](#input\_container\_registry\_name) | The name of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_container_registry_rg"></a> [container\_registry\_rg](#input\_container\_registry\_rg) | The resource group of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_database_connection_string"></a> [database\_connection\_string](#input\_database\_connection\_string) | The connection string used to connect to the Applications Back Office MySQL database | `string` | n/a | yes |
| <a name="input_deadline_submissions_result_topic_name"></a> [deadline\_submissions\_result\_topic\_name](#input\_deadline\_submissions\_result\_topic\_name) | Deadline Submissions Result Topic Name | `string` | n/a | yes |
| <a name="input_deadline_submissions_topic_name"></a> [deadline\_submissions\_topic\_name](#input\_deadline\_submissions\_topic\_name) | Deadline Submissions Topic Name | `string` | n/a | yes |
| <a name="input_document_check_function_storage_name"></a> [document\_check\_function\_storage\_name](#input\_document\_check\_function\_storage\_name) | Function Storage name | `string` | n/a | yes |
| <a name="input_document_check_function_storage_primary_access_key"></a> [document\_check\_function\_storage\_primary\_access\_key](#input\_document\_check\_function\_storage\_primary\_access\_key) | Function Storage Primary Access Key | `string` | n/a | yes |
| <a name="input_document_storage_api_host"></a> [document\_storage\_api\_host](#input\_document\_storage\_api\_host) | The full URI to the storage account used for back office documents | `string` | n/a | yes |
| <a name="input_document_storage_back_office_document_service_uploads_container_name"></a> [document\_storage\_back\_office\_document\_service\_uploads\_container\_name](#input\_document\_storage\_back\_office\_document\_service\_uploads\_container\_name) | Document Storage document service uploads container name | `string` | n/a | yes |
| <a name="input_document_storage_back_office_document_service_uploads_container_resource_manager_id"></a> [document\_storage\_back\_office\_document\_service\_uploads\_container\_resource\_manager\_id](#input\_document\_storage\_back\_office\_document\_service\_uploads\_container\_resource\_manager\_id) | Back Office document-service-uploads container resource\_manager\_id | `string` | n/a | yes |
| <a name="input_document_storage_back_office_published_documents_container_resource_manager_id"></a> [document\_storage\_back\_office\_published\_documents\_container\_resource\_manager\_id](#input\_document\_storage\_back\_office\_published\_documents\_container\_resource\_manager\_id) | Back Office published-documents container resource\_manager\_id | `string` | n/a | yes |
| <a name="input_document_storage_submissions_container_resource_manager_id"></a> [document\_storage\_submissions\_container\_resource\_manager\_id](#input\_document\_storage\_submissions\_container\_resource\_manager\_id) | Submissions container resource\_manager\_id | `string` | n/a | yes |
| <a name="input_employee_topic_id"></a> [employee\_topic\_id](#input\_employee\_topic\_id) | The ID of the employee topic | `string` | `""` | no |
| <a name="input_endpoint_subnet_id"></a> [endpoint\_subnet\_id](#input\_endpoint\_subnet\_id) | The id of the private endpoint subnet the app service is linked to for ingress traffic | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_feature_document_scanning_enabled"></a> [feature\_document\_scanning\_enabled](#input\_feature\_document\_scanning\_enabled) | Whether or not Document Scanning has been enabled. Document Scanning is currently disabled in a DR deployment (in the secondary region), documents will be scanned when the primary comes online. | `bool` | `false` | no |
| <a name="input_feature_odw_subscription_enabled"></a> [feature\_odw\_subscription\_enabled](#input\_feature\_odw\_subscription\_enabled) | Temporary flag to enable/disable ODW subscription integration. Always disabled for uk-south for now. | `bool` | `false` | no |
| <a name="input_feature_service_bus_enabled"></a> [feature\_service\_bus\_enabled](#input\_feature\_service\_bus\_enabled) | Whether or not Service Bus events are enabled | `string` | n/a | yes |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string` | n/a | yes |
| <a name="input_key_vault_uri"></a> [key\_vault\_uri](#input\_key\_vault\_uri) | The URI of the Key Vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location the App Services are deployed to in slug format e.g. 'uk-south' | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Azure Monitor Log Analytics Workspace | `string` | n/a | yes |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool` | `false` | no |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string` | `"development"` | no |
| <a name="input_notify_subscribers_function_gov_notify_template_id"></a> [notify\_subscribers\_function\_gov\_notify\_template\_id](#input\_notify\_subscribers\_function\_gov\_notify\_template\_id) | Notify Subscribers Function - GovNotify Template ID | `string` | n/a | yes |
| <a name="input_private_endpoint_enabled"></a> [private\_endpoint\_enabled](#input\_private\_endpoint\_enabled) | A switch to determine if Private Endpoint should be enabled for backend App Services | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group that will contain the App Services | `string` | n/a | yes |
| <a name="input_resource_suffix"></a> [resource\_suffix](#input\_resource\_suffix) | The suffix for resource naming | `string` | n/a | yes |
| <a name="input_service_bus_appeals_fo_appellant_submission_id"></a> [service\_bus\_appeals\_fo\_appellant\_submission\_id](#input\_service\_bus\_appeals\_fo\_appellant\_submission\_id) | Service Bus Topic FO Appellant Case Command | `string` | n/a | yes |
| <a name="input_service_bus_appeals_fo_lpa_response_submission_id"></a> [service\_bus\_appeals\_fo\_lpa\_response\_submission\_id](#input\_service\_bus\_appeals\_fo\_lpa\_response\_submission\_id) | Service Bus Topic FO LPA Questionnaire Command | `string` | n/a | yes |
| <a name="input_service_bus_namespace_id"></a> [service\_bus\_namespace\_id](#input\_service\_bus\_namespace\_id) | The ID of the Back Office service bus namespace | `string` | `null` | no |
| <a name="input_service_bus_namespace_name"></a> [service\_bus\_namespace\_name](#input\_service\_bus\_namespace\_name) | The name of the Back Office service bus namespace | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the service the Azure App Services are part of | `string` | n/a | yes |
| <a name="input_service_plan_sku"></a> [service\_plan\_sku](#input\_service\_plan\_sku) | The SKU of the App Service Plan providing resources to hosted App Services | `string` | `"P2v2"` | no |
| <a name="input_servicebus_topic_deadline_submission_result_id"></a> [servicebus\_topic\_deadline\_submission\_result\_id](#input\_servicebus\_topic\_deadline\_submission\_result\_id) | Service Bus Topic deadline-submission-result id | `string` | n/a | yes |
| <a name="input_servicebus_topic_deadline_submission_topic_id"></a> [servicebus\_topic\_deadline\_submission\_topic\_id](#input\_servicebus\_topic\_deadline\_submission\_topic\_id) | Service Bus Topic deadline-submission-topic id | `string` | n/a | yes |
| <a name="input_servicebus_topic_nsip_documents_id"></a> [servicebus\_topic\_nsip\_documents\_id](#input\_servicebus\_topic\_nsip\_documents\_id) | Service Bus Topic nsip-document id | `string` | n/a | yes |
| <a name="input_servicebus_topic_nsip_project_update_id"></a> [servicebus\_topic\_nsip\_project\_update\_id](#input\_servicebus\_topic\_nsip\_project\_update\_id) | Service Bus Topic nsip-project-update id | `string` | n/a | yes |
| <a name="input_servicebus_topic_register_nsip_subscription_id"></a> [servicebus\_topic\_register\_nsip\_subscription\_id](#input\_servicebus\_topic\_register\_nsip\_subscription\_id) | Service Bus Topic register-nsip-subscription id | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags applied to all resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_principal_ids"></a> [app\_service\_principal\_ids](#output\_app\_service\_principal\_ids) | A map of App Service principal IDs |
| <a name="output_app_service_urls"></a> [app\_service\_urls](#output\_app\_service\_urls) | A map of App Service URLs |
| <a name="output_appeals_web_frontend_url"></a> [appeals\_web\_frontend\_url](#output\_appeals\_web\_frontend\_url) | The URL of the web frontend App Service |
| <a name="output_clamav_host"></a> [clamav\_host](#output\_clamav\_host) | Hostname of the ClamAV Container Group |
| <a name="output_secret_names"></a> [secret\_names](#output\_secret\_names) | List of Key Vault secrets required for this component |
| <a name="output_web_frontend_url"></a> [web\_frontend\_url](#output\_web\_frontend\_url) | The URL of the web frontend App Service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
