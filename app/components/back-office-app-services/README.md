# Back Office App Services

This module contains the App Services resources for the Back Office service. These are placed in a sub-module as they need to be deployed to multiple Locations.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_service"></a> [app\_service](#module\_app\_service) | ../../modules/node-app-service | n/a |
| <a name="module_azure_region"></a> [azure\_region](#module\_azure\_region) | claranet/regions/azurerm | 4.2.1 |
| <a name="module_clam_av_container"></a> [clam\_av\_container](#module\_clam\_av\_container) | ./clamav-container | n/a |
| <a name="module_document_check_function"></a> [document\_check\_function](#module\_document\_check\_function) | ./document-check-function | n/a |
| <a name="module_odw_subscriber_function"></a> [odw\_subscriber\_function](#module\_odw\_subscriber\_function) | ./odw-subscriber-function | n/a |
| <a name="module_publish_document_function"></a> [publish\_document\_function](#module\_publish\_document\_function) | ./publish-document-function | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.applications_case_admin_officer_documents_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.applications_caseteam_documents_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.back_office_app_send_service_bus_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/role_assignment) | resource |
| [azurerm_service_plan.back_office_functions_plan](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/resources/service_plan) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.6.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_low_id"></a> [action\_group\_low\_id](#input\_action\_group\_low\_id) | The ID of the Azure Monitor action group for low priority alerts | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
| <a name="input_app_service_plan_resource_group_name"></a> [app\_service\_plan\_resource\_group\_name](#input\_app\_service\_plan\_resource\_group\_name) | The App Service Plan resource group name required for custom hostname certificate placement | `string` | `null` | no |
| <a name="input_app_service_private_dns_zone_id"></a> [app\_service\_private\_dns\_zone\_id](#input\_app\_service\_private\_dns\_zone\_id) | The id of the private DNS zone for App services | `string` | n/a | yes |
| <a name="input_azuread_appeals_case_officer_group_id"></a> [azuread\_appeals\_case\_officer\_group\_id](#input\_azuread\_appeals\_case\_officer\_group\_id) | The Azure AD group ID for Appeals Back Office case officers | `string` | `null` | no |
| <a name="input_azuread_appeals_inspector_group_id"></a> [azuread\_appeals\_inspector\_group\_id](#input\_azuread\_appeals\_inspector\_group\_id) | The Azure AD group ID for Appeals Back Office inspectors | `string` | `null` | no |
| <a name="input_azuread_appeals_validation_officer_group_id"></a> [azuread\_appeals\_validation\_officer\_group\_id](#input\_azuread\_appeals\_validation\_officer\_group\_id) | The Azure AD group ID for Appeals Back Office validation officers | `string` | `null` | no |
| <a name="input_azuread_applications_case_admin_officer_group_id"></a> [azuread\_applications\_case\_admin\_officer\_group\_id](#input\_azuread\_applications\_case\_admin\_officer\_group\_id) | The Azure AD group ID for Applications Back Office case admin officers | `string` | `null` | no |
| <a name="input_azuread_applications_caseteam_group_id"></a> [azuread\_applications\_caseteam\_group\_id](#input\_azuread\_applications\_caseteam\_group\_id) | The Azure AD group ID for Applications Back Office case team | `string` | `null` | no |
| <a name="input_azuread_applications_inspector_group_id"></a> [azuread\_applications\_inspector\_group\_id](#input\_azuread\_applications\_inspector\_group\_id) | The Azure AD group ID for Applications Back Office inspectors | `string` | `null` | no |
| <a name="input_azuread_auth_client_id"></a> [azuread\_auth\_client\_id](#input\_azuread\_auth\_client\_id) | The Back Office web frontend app registration ID used for Azure AD authentication | `string` | `null` | no |
| <a name="input_back_office_clamav_subnet_id"></a> [back\_office\_clamav\_subnet\_id](#input\_back\_office\_clamav\_subnet\_id) | Integration subnet for the clamav container | `string` | n/a | yes |
| <a name="input_back_office_document_storage_connection_string"></a> [back\_office\_document\_storage\_connection\_string](#input\_back\_office\_document\_storage\_connection\_string) | The azurerm\_storage\_account back\_office\_documents connection string | `string` | n/a | yes |
| <a name="input_back_office_integration_subnet_id"></a> [back\_office\_integration\_subnet\_id](#input\_back\_office\_integration\_subnet\_id) | Integration subnet for back office anti-virus resources | `string` | n/a | yes |
| <a name="input_common_vnet_id"></a> [common\_vnet\_id](#input\_common\_vnet\_id) | The common infrastructure virtual network id | `string` | n/a | yes |
| <a name="input_container_registry_name"></a> [container\_registry\_name](#input\_container\_registry\_name) | The name of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_container_registry_rg"></a> [container\_registry\_rg](#input\_container\_registry\_rg) | The resource group of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_custom_hostname"></a> [custom\_hostname](#input\_custom\_hostname) | The custom hostname applied to the App Service required for auth redirection with a reverse proxy | `string` | `null` | no |
| <a name="input_custom_hostname_certificate_secret_id"></a> [custom\_hostname\_certificate\_secret\_id](#input\_custom\_hostname\_certificate\_secret\_id) | The Key Vault secret URL for the custom hostname SSL certificate | `string` | `null` | no |
| <a name="input_database_connection_string"></a> [database\_connection\_string](#input\_database\_connection\_string) | The connection string used to connect to the MySQL database | `string` | n/a | yes |
| <a name="input_document_check_function_storage_name"></a> [document\_check\_function\_storage\_name](#input\_document\_check\_function\_storage\_name) | Function Storage name | `string` | n/a | yes |
| <a name="input_document_check_function_storage_primary_access_key"></a> [document\_check\_function\_storage\_primary\_access\_key](#input\_document\_check\_function\_storage\_primary\_access\_key) | Function Storage Primary Access Key | `string` | n/a | yes |
| <a name="input_document_storage_api_host"></a> [document\_storage\_api\_host](#input\_document\_storage\_api\_host) | The full URI to the storage account used for back office documents | `string` | n/a | yes |
| <a name="input_document_storage_back_office_documents_id"></a> [document\_storage\_back\_office\_documents\_id](#input\_document\_storage\_back\_office\_documents\_id) | The azurerm\_storage\_account back\_office\_documents resource id | `string` | n/a | yes |
| <a name="input_document_storage_container"></a> [document\_storage\_container](#input\_document\_storage\_container) | The container in Blob Storage used for Back Office storage of documents | `string` | n/a | yes |
| <a name="input_employee_topic_id"></a> [employee\_topic\_id](#input\_employee\_topic\_id) | The ID of the employee topic | `string` | `""` | no |
| <a name="input_endpoint_subnet_id"></a> [endpoint\_subnet\_id](#input\_endpoint\_subnet\_id) | The id of the private endpoint subnet the app service is linked to for ingress traffic | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_feature_document_scanning_enabled"></a> [feature\_document\_scanning\_enabled](#input\_feature\_document\_scanning\_enabled) | Indicates whether ClamAV Document Scanning has been enabled | `bool` | `false` | no |
| <a name="input_feature_odw_subscription_enabled"></a> [feature\_odw\_subscription\_enabled](#input\_feature\_odw\_subscription\_enabled) | Temporary flag to enable/disable ODW subscription integration. Always disabled for uk-south for now. | `bool` | `false` | no |
| <a name="input_feature_service_bus_enabled"></a> [feature\_service\_bus\_enabled](#input\_feature\_service\_bus\_enabled) | Whether or not Service Bus events are enabled | `string` | n/a | yes |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string` | n/a | yes |
| <a name="input_key_vault_uri"></a> [key\_vault\_uri](#input\_key\_vault\_uri) | The URI of the Key Vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location the App Services are deployed to in slug format e.g. 'uk-south' | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Azure Monitor Log Analytics Workspace | `string` | n/a | yes |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool` | `false` | no |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string` | `"development"` | no |
| <a name="input_private_endpoint_enabled"></a> [private\_endpoint\_enabled](#input\_private\_endpoint\_enabled) | A switch to determine if Private Endpoint should be enabled for backend App Services | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group that will contain the App Services | `string` | n/a | yes |
| <a name="input_resource_suffix"></a> [resource\_suffix](#input\_resource\_suffix) | The suffix for resource naming | `string` | n/a | yes |
| <a name="input_service_bus_namespace_id"></a> [service\_bus\_namespace\_id](#input\_service\_bus\_namespace\_id) | The ID of the Back Office service bus namespace | `string` | `null` | no |
| <a name="input_service_bus_namespace_name"></a> [service\_bus\_namespace\_name](#input\_service\_bus\_namespace\_name) | The name of the Back Office service bus namespace | `string` | `null` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the service the Azure App Services are part of | `string` | n/a | yes |
| <a name="input_service_plan_sku"></a> [service\_plan\_sku](#input\_service\_plan\_sku) | The SKU of the App Service Plan providing resources to hosted App Services | `string` | `"P2v2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags applied to all resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_principal_ids"></a> [app\_service\_principal\_ids](#output\_app\_service\_principal\_ids) | A map of App Service principal IDs |
| <a name="output_app_service_urls"></a> [app\_service\_urls](#output\_app\_service\_urls) | A map of App Service URLs |
| <a name="output_secret_names"></a> [secret\_names](#output\_secret\_names) | List of Key Vault secrets required for this component |
| <a name="output_web_frontend_url"></a> [web\_frontend\_url](#output\_web\_frontend\_url) | The URL of the web frontend App Service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
