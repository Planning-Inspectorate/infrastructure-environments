# Node App service

This Terraform module creates an App service to deploy backend or frontend services.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_virtual_network_swift_connection.vnet_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_key_vault_access_policy.read_secrets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_linux_web_app.web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app_slot.staging](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
| [azurerm_monitor_activity_log_alert.app_service_delete](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_activity_log_alert) | resource |
| [azurerm_monitor_activity_log_alert.app_service_stop](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_activity_log_alert) | resource |
| [azurerm_monitor_metric_alert.app_service_http_5xx](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.app_service_response_time](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_private_endpoint.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_low_id"></a> [action\_group\_low\_id](#input\_action\_group\_low\_id) | The ID of the Azure Monitor action group for low priority alerts | `string` | n/a | yes |
| <a name="input_app_insights_connection_string"></a> [app\_insights\_connection\_string](#input\_app\_insights\_connection\_string) | The connection string to connect to an Application Insights resource | `string` | n/a | yes |
| <a name="input_app_insights_instrumentation_key"></a> [app\_insights\_instrumentation\_key](#input\_app\_insights\_instrumentation\_key) | The instrumentation key to connect to an Application Insights resource | `string` | n/a | yes |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The name of the app service | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
| <a name="input_app_service_private_dns_zone_id"></a> [app\_service\_private\_dns\_zone\_id](#input\_app\_service\_private\_dns\_zone\_id) | The id of the private DNS zone for App services | `string` | `null` | no |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | The environment variables to be passed to the application | `map(string)` | `{}` | no |
| <a name="input_container_registry_login_server"></a> [container\_registry\_login\_server](#input\_container\_registry\_login\_server) | The URL that can be used to log into the container registry | `string` | n/a | yes |
| <a name="input_container_registry_server_password"></a> [container\_registry\_server\_password](#input\_container\_registry\_server\_password) | The password used to connect to the container registry so that App Service can pull images | `string` | n/a | yes |
| <a name="input_container_registry_server_username"></a> [container\_registry\_server\_username](#input\_container\_registry\_server\_username) | The username used to connect to the container registry so that App Service can pull images | `string` | n/a | yes |
| <a name="input_deployment_slot"></a> [deployment\_slot](#input\_deployment\_slot) | Flag to indicate if the App Service should create a deployment slot | `bool` | `true` | no |
| <a name="input_endpoint_subnet_id"></a> [endpoint\_subnet\_id](#input\_endpoint\_subnet\_id) | The id of the private endpoint subnet the app service is linked to for ingress traffic | `string` | `null` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | The name of the image deployed to the App Service | `string` | n/a | yes |
| <a name="input_inbound_vnet_connectivity"></a> [inbound\_vnet\_connectivity](#input\_inbound\_vnet\_connectivity) | Indicates whether inbound connectivity (Private Endpoint) is required | `bool` | `false` | no |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string` | `null` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The name of the app service location | `string` | n/a | yes |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool` | `false` | no |
| <a name="input_outbound_vnet_connectivity"></a> [outbound\_vnet\_connectivity](#input\_outbound\_vnet\_connectivity) | Indicates whether outbound connectivity (VNET Integration) is required | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_resource_suffix"></a> [resource\_suffix](#input\_resource\_suffix) | The suffix for resource naming | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the service the app belongs to | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags applied to all resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_site_hostname"></a> [default\_site\_hostname](#output\_default\_site\_hostname) | The Default Hostname associated with the App Service |
| <a name="output_principal_id"></a> [principal\_id](#output\_principal\_id) | The ID of the principal associated with the App Service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
