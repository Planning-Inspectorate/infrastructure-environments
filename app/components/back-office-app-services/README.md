# Back Office App Services

This module contains the App Services resources for the Back Office service. These are placed in a sub-module as they need to be deployed to multiple Locations.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_service"></a> [app\_service](#module\_app\_service) | ../../modules/node-app-service | n/a |
| <a name="module_azure_region"></a> [azure\_region](#module\_azure\_region) | claranet/regions/azurerm | 4.2.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_low_id"></a> [action\_group\_low\_id](#input\_action\_group\_low\_id) | The ID of the Azure Monitor action group for low priority alerts | `string` | n/a | yes |
| <a name="input_app_insights_connection_string"></a> [app\_insights\_connection\_string](#input\_app\_insights\_connection\_string) | The connection string to connect to an Application Insights resource | `string` | n/a | yes |
| <a name="input_app_insights_instrumentation_key"></a> [app\_insights\_instrumentation\_key](#input\_app\_insights\_instrumentation\_key) | The instrumentation key to connect to an Application Insights resource | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
| <a name="input_app_service_private_dns_zone_id"></a> [app\_service\_private\_dns\_zone\_id](#input\_app\_service\_private\_dns\_zone\_id) | The id of the private DNS zone for App services | `string` | n/a | yes |
| <a name="input_azuread_auth_case_officer_group_id"></a> [azuread\_auth\_case\_officer\_group\_id](#input\_azuread\_auth\_case\_officer\_group\_id) | The Azure AD group ID for Back Office case officers | `string` | `null` | no |
| <a name="input_azuread_auth_client_id"></a> [azuread\_auth\_client\_id](#input\_azuread\_auth\_client\_id) | The Back Office web frontend app registration ID used for Azure AD authentication | `string` | `null` | no |
| <a name="input_azuread_auth_inspector_group_id"></a> [azuread\_auth\_inspector\_group\_id](#input\_azuread\_auth\_inspector\_group\_id) | The Azure AD group ID for Back Office inspectors | `string` | `null` | no |
| <a name="input_azuread_auth_validation_office_group_id"></a> [azuread\_auth\_validation\_office\_group\_id](#input\_azuread\_auth\_validation\_office\_group\_id) | The Azure AD group ID for Back Office validation officers | `string` | `null` | no |
| <a name="input_container_registry_login_server"></a> [container\_registry\_login\_server](#input\_container\_registry\_login\_server) | The URL used to connect to the Azure Container Registry | `string` | n/a | yes |
| <a name="input_container_registry_password"></a> [container\_registry\_password](#input\_container\_registry\_password) | The password used to connect to the Azure Container Registry | `string` | n/a | yes |
| <a name="input_container_registry_username"></a> [container\_registry\_username](#input\_container\_registry\_username) | The username used to connect to the Azure Container Registry | `string` | n/a | yes |
| <a name="input_custom_hostname"></a> [custom\_hostname](#input\_custom\_hostname) | The custom hostname applied to the App Service required for auth redirection with a reverse proxy | `string` | `null` | no |
| <a name="input_custom_hostname_certificate_secret_id"></a> [custom\_hostname\_certificate\_secret\_id](#input\_custom\_hostname\_certificate\_secret\_id) | The Key Vault secret URL for the custom hostname SSL certificate | `string` | `null` | no |
| <a name="input_database_connection_string"></a> [database\_connection\_string](#input\_database\_connection\_string) | The connection string used to connect to the MySQL database | `string` | n/a | yes |
| <a name="input_endpoint_subnet_id"></a> [endpoint\_subnet\_id](#input\_endpoint\_subnet\_id) | The id of the private endpoint subnet the app service is linked to for ingress traffic | `string` | n/a | yes |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string` | n/a | yes |
| <a name="input_key_vault_uri"></a> [key\_vault\_uri](#input\_key\_vault\_uri) | The URI of the Key Vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location the App Services are deployed to in slug format e.g. 'uk-south' | `string` | n/a | yes |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool` | `false` | no |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string` | `"development"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group that will contain the App Services | `string` | n/a | yes |
| <a name="input_resource_suffix"></a> [resource\_suffix](#input\_resource\_suffix) | The suffix for resource naming | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the service the Azure App Services are part of | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags applied to all resources | `map(string)` | n/a | yes |
| <a name="input_use_deployment_slots"></a> [use\_deployment\_slots](#input\_use\_deployment\_slots) | Flag to indicate if App Service deployment slots are in use on the environment | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_principal_ids"></a> [app\_service\_principal\_ids](#output\_app\_service\_principal\_ids) | A map of App Service principal IDs |
| <a name="output_app_service_urls"></a> [app\_service\_urls](#output\_app\_service\_urls) | A map of App Service URLs |
| <a name="output_secret_names"></a> [secret\_names](#output\_secret\_names) | List of Key Vault secrets required for this component |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
