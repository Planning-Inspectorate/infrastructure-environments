# Applications service

This component contains the infrastructure required for the applications service. This includes frontend and backend App Services.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

No requirements.

## Providers

| Name                                                                                 | Version |
| ------------------------------------------------------------------------------------ | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm)                         | 3.6.0   |
| <a name="provider_azurerm.tooling"></a> [azurerm.tooling](#provider_azurerm.tooling) | 3.6.0   |

## Modules

| Name                                                                                | Source                                        | Version |
| ----------------------------------------------------------------------------------- | --------------------------------------------- | ------- |
| <a name="module_app_services"></a> [app_services](#module_app_services)             | ../../../components/applications-app-services | n/a     |
| <a name="module_azure_region_ukw"></a> [azure_region_ukw](#module_azure_region_ukw) | claranet/regions/azurerm                      | 4.2.1   |

## Resources

| Name                                                                                                                                                                                     | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azurerm_key_vault_secret.app_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret)                                                  | resource    |
| [azurerm_local_network_gateway.national_infrastructure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway)                           | resource    |
| [azurerm_log_analytics_workspace.applications_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace)                          | resource    |
| [azurerm_resource_group.applications_service_stack](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)                                      | resource    |
| [azurerm_subnet.applications_service_ingress](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)                                                    | resource    |
| [azurerm_virtual_network_gateway_connection.national_infrastructure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource    |
| [azurerm_private_dns_zone.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone)                                              | data source |

## Inputs

| Name                                                                                                                                                                                                                           | Description                                                                              | Type           | Default         | Required |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- | -------------- | --------------- | :------: |
| <a name="input_action_group_low_id"></a> [action_group_low_id](#input_action_group_low_id)                                                                                                                                     | The ID of the Azure Monitor action group for low priority (P4) alerts                    | `string`       | n/a             |   yes    |
| <a name="input_api_timeout"></a> [api_timeout](#input_api_timeout)                                                                                                                                                             | The timeout in milliseconds for API calls in the frontend apps                           | `string`       | n/a             |   yes    |
| <a name="input_app_service_plan_id"></a> [app_service_plan_id](#input_app_service_plan_id)                                                                                                                                     | The id of the app service plan                                                           | `string`       | n/a             |   yes    |
| <a name="input_applications_service_public_url"></a> [applications_service_public_url](#input_applications_service_public_url)                                                                                                 | The public URL for the Applications Service frontend web app                             | `string`       | n/a             |   yes    |
| <a name="input_applications_service_vpn_gateway_shared_key"></a> [applications_service_vpn_gateway_shared_key](#input_applications_service_vpn_gateway_shared_key)                                                             | The applications service virtual network gateway shared key                              | `string`       | n/a             |   yes    |
| <a name="input_common_resource_group_name"></a> [common_resource_group_name](#input_common_resource_group_name)                                                                                                                | The common infrastructure resource group name                                            | `string`       | n/a             |   yes    |
| <a name="input_common_tags"></a> [common_tags](#input_common_tags)                                                                                                                                                             | The common resource tags for the project                                                 | `map(string)`  | n/a             |   yes    |
| <a name="input_common_vnet_cidr_blocks"></a> [common_vnet_cidr_blocks](#input_common_vnet_cidr_blocks)                                                                                                                         | A map of IP address blocks from the subnet name to the allocated CIDR prefix             | `map(string)`  | n/a             |   yes    |
| <a name="input_common_vnet_gateway_id"></a> [common_vnet_gateway_id](#input_common_vnet_gateway_id)                                                                                                                            | The id of the common infrastructure virtual network gateway                              | `string`       | n/a             |   yes    |
| <a name="input_common_vnet_name"></a> [common_vnet_name](#input_common_vnet_name)                                                                                                                                              | The common infrastructure virtual network name                                           | `string`       | n/a             |   yes    |
| <a name="input_container_registry_name"></a> [container_registry_name](#input_container_registry_name)                                                                                                                         | The name of the container registry that hosts the image                                  | `string`       | n/a             |   yes    |
| <a name="input_container_registry_rg"></a> [container_registry_rg](#input_container_registry_rg)                                                                                                                               | The resource group of the container registry that hosts the image                        | `string`       | n/a             |   yes    |
| <a name="input_environment"></a> [environment](#input_environment)                                                                                                                                                             | The environment resources are deployed to e.g. 'dev'                                     | `string`       | n/a             |   yes    |
| <a name="input_feature_save_and_exit_option"></a> [feature_save_and_exit_option](#input_feature_save_and_exit_option)                                                                                                          | Feature toggle for showing the save and exit option on registration form                 | `string`       | n/a             |   yes    |
| <a name="input_google_analytics_id"></a> [google_analytics_id](#input_google_analytics_id)                                                                                                                                     | The id used to connect the frontend app to Google Analytics                              | `string`       | n/a             |   yes    |
| <a name="input_instance"></a> [instance](#input_instance)                                                                                                                                                                      | The environment instance for use if multiple environments are deployed to a subscription | `string`       | `"001"`         |    no    |
| <a name="input_integration_subnet_id"></a> [integration_subnet_id](#input_integration_subnet_id)                                                                                                                               | The id of the vnet integration subnet the app service is linked to for egress traffic    | `string`       | n/a             |   yes    |
| <a name="input_key_vault_id"></a> [key_vault_id](#input_key_vault_id)                                                                                                                                                          | The ID of the key vault so the App Service can pull secret values                        | `string`       | n/a             |   yes    |
| <a name="input_key_vault_uri"></a> [key_vault_uri](#input_key_vault_uri)                                                                                                                                                       | The URI of the Key Vault                                                                 | `string`       | n/a             |   yes    |
| <a name="input_location"></a> [location](#input_location)                                                                                                                                                                      | The location resources are deployed to in slug format e.g. 'uk-south'                    | `string`       | `"uk-west"`     |    no    |
| <a name="input_logger_level"></a> [logger_level](#input_logger_level)                                                                                                                                                          | The level of logging enabled for applications in the environment e.g. info               | `string`       | `"info"`        |    no    |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring_alerts_enabled](#input_monitoring_alerts_enabled)                                                                                                                   | Indicates whether Azure Monitor alerts are enabled for App Service                       | `bool`         | `false`         |    no    |
| <a name="input_national_infrastructure_gateway_ip"></a> [national_infrastructure_gateway_ip](#input_national_infrastructure_gateway_ip)                                                                                        | The public IP address of the National Infrastructure gateway endpoint                    | `string`       | n/a             |   yes    |
| <a name="input_national_infrastructure_vnet_address_space"></a> [national_infrastructure_vnet_address_space](#input_national_infrastructure_vnet_address_space)                                                                | The address space advertised by the National Infrastructure gateway endpoint             | `list(string)` | n/a             |   yes    |
| <a name="input_node_environment"></a> [node_environment](#input_node_environment)                                                                                                                                              | The node environment to be used for applications in this environment e.g. development    | `string`       | `"development"` |    no    |
| <a name="input_private_beta_v1_routes_only"></a> [private_beta_v1_routes_only](#input_private_beta_v1_routes_only)                                                                                                             | Feature toggle for limiting web app routes to Private Beta V1 functionality only         | `string`       | n/a             |   yes    |
| <a name="input_private_endpoint_enabled"></a> [private_endpoint_enabled](#input_private_endpoint_enabled)                                                                                                                      | A switch to determine if Private Endpoint should be enabled for backend App Services     | `bool`         | `true`          |    no    |
| <a name="input_srv_notify_base_url"></a> [srv_notify_base_url](#input_srv_notify_base_url)                                                                                                                                     | The base URL for the Notifications service                                               | `string`       | n/a             |   yes    |
| <a name="input_srv_notify_ip_registration_confirmation_email_to_ip_template_id"></a> [srv_notify_ip_registration_confirmation_email_to_ip_template_id](#input_srv_notify_ip_registration_confirmation_email_to_ip_template_id) | The template ID for the IP registration confirmation email                               | `string`       | n/a             |   yes    |
| <a name="input_srv_notify_magic_link_email_template_id"></a> [srv_notify_magic_link_email_template_id](#input_srv_notify_magic_link_email_template_id)                                                                         | The template ID for the magic link email                                                 | `string`       | n/a             |   yes    |
| <a name="input_srv_notify_service_id"></a> [srv_notify_service_id](#input_srv_notify_service_id)                                                                                                                               | The ID of the Notifications service                                                      | `string`       | n/a             |   yes    |
| <a name="input_documents_host"></a> [documents_host](#input_documents_host)                                                                                                                                                    | Specifies environment specific Wordpress CMS URL Prefix                                  | `string`       | n/a             |   yes    |

## Outputs

| Name                                                                                | Description                        |
| ----------------------------------------------------------------------------------- | ---------------------------------- |
| <a name="output_app_service_urls"></a> [app_service_urls](#output_app_service_urls) | A map of frontend app service URLs |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
