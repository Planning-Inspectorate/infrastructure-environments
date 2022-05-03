# Appeals service App Services

This module contains the App Services resources for the appeals service. These are placed in a sub-module as they need to be deployed to multiple Locations.

This module also contains some resources such as Service Bus and Function Apps required to connect to Horizon.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_service"></a> [app\_service](#module\_app\_service) | ../../modules/node-app-service | n/a |
| <a name="module_azure_region"></a> [azure\_region](#module\_azure\_region) | claranet/regions/azurerm | 4.2.1 |
| <a name="module_horizon_functions"></a> [horizon\_functions](#module\_horizon\_functions) | ../../modules/node-function-app | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.documents_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_servicebus_namespace.horizon](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace) | resource |
| [azurerm_servicebus_namespace_authorization_rule.horizon_function_apps](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace_authorization_rule) | resource |
| [azurerm_servicebus_queue.horizon_add_document](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |
| [azurerm_servicebus_queue.horizon_create_contact](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |
| [azurerm_servicebus_queue.horizon_householder_appeal_publish](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_low_id"></a> [action\_group\_low\_id](#input\_action\_group\_low\_id) | The ID of the Azure Monitor action group for low priority alerts | `string` | n/a | yes |
| <a name="input_api_timeout"></a> [api\_timeout](#input\_api\_timeout) | The timeout in milliseconds for API calls in the frontend apps | `string` | n/a | yes |
| <a name="input_app_insights_connection_string"></a> [app\_insights\_connection\_string](#input\_app\_insights\_connection\_string) | The connection string to connect to an Application Insights resource | `string` | n/a | yes |
| <a name="input_app_insights_instrumentation_key"></a> [app\_insights\_instrumentation\_key](#input\_app\_insights\_instrumentation\_key) | The instrumentation key to connect to an Application Insights resource | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
| <a name="input_app_service_private_dns_zone_id"></a> [app\_service\_private\_dns\_zone\_id](#input\_app\_service\_private\_dns\_zone\_id) | The id of the private DNS zone for App services | `string` | n/a | yes |
| <a name="input_appeal_documents_primary_blob_connection_string"></a> [appeal\_documents\_primary\_blob\_connection\_string](#input\_appeal\_documents\_primary\_blob\_connection\_string) | The Appeal Documents Storage Account blob connection string associated with the primary location | `string` | n/a | yes |
| <a name="input_appeal_documents_storage_container_name"></a> [appeal\_documents\_storage\_container\_name](#input\_appeal\_documents\_storage\_container\_name) | The name of the Storage Container for Appeal Documents | `string` | n/a | yes |
| <a name="input_appeals_service_public_url"></a> [appeals\_service\_public\_url](#input\_appeals\_service\_public\_url) | The public URL for the Appeals Service frontend web app | `string` | n/a | yes |
| <a name="input_container_registry_login_server"></a> [container\_registry\_login\_server](#input\_container\_registry\_login\_server) | The URL used to connect to the Azure Container Registry | `string` | n/a | yes |
| <a name="input_container_registry_password"></a> [container\_registry\_password](#input\_container\_registry\_password) | The password used to connect to the Azure Container Registry | `string` | n/a | yes |
| <a name="input_container_registry_username"></a> [container\_registry\_username](#input\_container\_registry\_username) | The username used to connect to the Azure Container Registry | `string` | n/a | yes |
| <a name="input_cosmosdb_connection_string"></a> [cosmosdb\_connection\_string](#input\_cosmosdb\_connection\_string) | The connection string of CosmosDB | `string` | n/a | yes |
| <a name="input_endpoint_subnet_id"></a> [endpoint\_subnet\_id](#input\_endpoint\_subnet\_id) | The id of the private endpoint subnet the app service is linked to for ingress traffic | `string` | n/a | yes |
| <a name="input_function_apps_storage_account"></a> [function\_apps\_storage\_account](#input\_function\_apps\_storage\_account) | The name of the storage account used by the Function Apps | `string` | n/a | yes |
| <a name="input_function_apps_storage_account_access_key"></a> [function\_apps\_storage\_account\_access\_key](#input\_function\_apps\_storage\_account\_access\_key) | The access key for the storage account | `string` | n/a | yes |
| <a name="input_google_analytics_id"></a> [google\_analytics\_id](#input\_google\_analytics\_id) | The id used to connect the frontend app to Google Analytics | `string` | n/a | yes |
| <a name="input_google_tag_manager_id"></a> [google\_tag\_manager\_id](#input\_google\_tag\_manager\_id) | The id used to connect the frontend app to Google Tag Manager | `string` | n/a | yes |
| <a name="input_horizon_url"></a> [horizon\_url](#input\_horizon\_url) | The URL used to connect to Horizon | `string` | n/a | yes |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string` | n/a | yes |
| <a name="input_key_vault_uri"></a> [key\_vault\_uri](#input\_key\_vault\_uri) | The URI of the Key Vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location the App Services are deployed to in slug format e.g. 'uk-south' | `string` | n/a | yes |
| <a name="input_logger_level"></a> [logger\_level](#input\_logger\_level) | The level of logging enabled for applications in the environment e.g. info | `string` | `"info"` | no |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool` | `false` | no |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string` | `"development"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group that will contain the App Services | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group that will contain the App Services | `string` | n/a | yes |
| <a name="input_resource_suffix"></a> [resource\_suffix](#input\_resource\_suffix) | The suffix for resource naming | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the service the Azure App Services are part of | `string` | n/a | yes |
| <a name="input_srv_notify_appeal_submission_confirmation_email_to_apellant_template_id"></a> [srv\_notify\_appeal\_submission\_confirmation\_email\_to\_apellant\_template\_id](#input\_srv\_notify\_appeal\_submission\_confirmation\_email\_to\_apellant\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_srv_notify_appeal_submission_received_notification_email_to_lpa_template_id"></a> [srv\_notify\_appeal\_submission\_received\_notification\_email\_to\_lpa\_template\_id](#input\_srv\_notify\_appeal\_submission\_received\_notification\_email\_to\_lpa\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_srv_notify_base_url"></a> [srv\_notify\_base\_url](#input\_srv\_notify\_base\_url) | The base URL for the Notifications service | `string` | n/a | yes |
| <a name="input_srv_notify_email_reply_to_id_start_email_to_lpa_template_id"></a> [srv\_notify\_email\_reply\_to\_id\_start\_email\_to\_lpa\_template\_id](#input\_srv\_notify\_email\_reply\_to\_id\_start\_email\_to\_lpa\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_srv_notify_full_appeal_confirmation_email_to_appellant_template_id"></a> [srv\_notify\_full\_appeal\_confirmation\_email\_to\_appellant\_template\_id](#input\_srv\_notify\_full\_appeal\_confirmation\_email\_to\_appellant\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_srv_notify_full_appeal_received_notification_email_to_lpa_template_id"></a> [srv\_notify\_full\_appeal\_received\_notification\_email\_to\_lpa\_template\_id](#input\_srv\_notify\_full\_appeal\_received\_notification\_email\_to\_lpa\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_srv_notify_service_id"></a> [srv\_notify\_service\_id](#input\_srv\_notify\_service\_id) | The ID of the Notifications service | `string` | n/a | yes |
| <a name="input_srv_notify_start_email_to_lpa_template_id"></a> [srv\_notify\_start\_email\_to\_lpa\_template\_id](#input\_srv\_notify\_start\_email\_to\_lpa\_template\_id) | A template ID required by the Appeals Service API | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags applied to all resources | `map(string)` | n/a | yes |
| <a name="input_use_deployment_slots"></a> [use\_deployment\_slots](#input\_use\_deployment\_slots) | Flag to indicate if App Service deployment slots are in use on the environment | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_principal_ids"></a> [app\_service\_principal\_ids](#output\_app\_service\_principal\_ids) | A map of App Service principal IDs |
| <a name="output_app_service_urls"></a> [app\_service\_urls](#output\_app\_service\_urls) | A map of App Service URLs |
| <a name="output_secret_names"></a> [secret\_names](#output\_secret\_names) | List of Key Vault secrets required for this component |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
