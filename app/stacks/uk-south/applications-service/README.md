# Applications service

This component contains the infrastructure required for the applications service. This includes a frontend and a backend for the National Infrastructure application.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.6, < 3.64.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.64.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.64.0 |
| <a name="provider_azurerm.tooling"></a> [azurerm.tooling](#provider\_azurerm.tooling) | 3.64.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_services"></a> [app\_services](#module\_app\_services) | ../../../components/applications-app-services | n/a |
| <a name="module_azure_region_uks"></a> [azure\_region\_uks](#module\_azure\_region\_uks) | claranet/regions/azurerm | 4.2.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.applications_sql_server_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.applications_sql_server_password](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.applications_sql_server_username](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.redis_cache_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/key_vault_secret) | resource |
| [azurerm_local_network_gateway.national_infrastructure](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/local_network_gateway) | resource |
| [azurerm_log_analytics_workspace.applcations_service](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/log_analytics_workspace) | resource |
| [azurerm_mssql_database.applications_sql_db](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/mssql_database) | resource |
| [azurerm_mssql_server.applications_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/mssql_server) | resource |
| [azurerm_private_dns_zone.redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.redis_cache_dns](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.applications_service_redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.applications_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/private_endpoint) | resource |
| [azurerm_redis_cache.applications_service_redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/redis_cache) | resource |
| [azurerm_resource_group.applications_service_stack](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/resource_group) | resource |
| [azurerm_storage_account.function_storage](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/storage_account) | resource |
| [azurerm_subnet.applications_service_ingress](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network_gateway_connection.national_infrastructure](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/resources/virtual_network_gateway_connection) | resource |
| [random_id.username_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_password.applications_sql_server_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_private_dns_zone.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.database](https://registry.terraform.io/providers/hashicorp/azurerm/3.64.0/docs/data-sources/private_dns_zone) | data source |

## Inputs

| Name | Description | Type           | Default | Required |
|------|-------------|----------------|---------|:--------:|
| <a name="input_action_group_low_id"></a> [action\_group\_low\_id](#input\_action\_group\_low\_id) | The ID of the Azure Monitor action group for low priority (P4) alerts | `string`       | n/a | yes |
| <a name="input_api_timeout"></a> [api\_timeout](#input\_api\_timeout) | The timeout in milliseconds for API calls in the frontend apps | `string`       | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string`       | n/a | yes |
| <a name="input_applications_service_public_url"></a> [applications\_service\_public\_url](#input\_applications\_service\_public\_url) | The public URL for the Applications Service frontend web app | `string`       | n/a | yes |
| <a name="input_applications_service_vpn_gateway_shared_key"></a> [applications\_service\_vpn\_gateway\_shared\_key](#input\_applications\_service\_vpn\_gateway\_shared\_key) | The applications service virtual network gateway shared key | `string`       | n/a | yes |
| <a name="input_back_office_integration_get_application_case_references"></a> [back\_office\_integration\_get\_application\_case\_references](#input\_back\_office\_integration\_get\_application\_case\_references) | list of case references (comma separated) that the application data is retrieved from back office | `string`       | n/a | yes |
| <a name="input_back_office_integration_get_documents_case_references"></a> [back\_office\_integration\_get\_documents\_case\_references](#input\_back\_office\_integration\_get\_documents\_case\_references) | list of case references (comma separated) that document data is retrieved from back office | `string`       | n/a | yes |
| <a name="input_back_office_service_bus_namespace_name"></a> [back\_office\_service\_bus\_namespace\_name](#input\_back\_office\_service\_bus\_namespace\_name) | Namespace of Back Office Service Bus instance | `string`       | `"tbc"` | no |
| <a name="input_back_office_service_bus_nsip_documents_topic_id"></a> [back\_office\_service\_bus\_nsip\_documents\_topic\_id](#input\_back\_office\_service\_bus\_nsip\_documents\_topic\_id) | ID for the nsip-document topic | `string`       | `""` | no |
| <a name="input_back_office_service_bus_nsip_project_topic_id"></a> [back\_office\_service\_bus\_nsip\_project\_topic\_id](#input\_back\_office\_service\_bus\_nsip\_project\_topic\_id) | ID for the nsip-project topic | `string`       | `""` | no |
| <a name="input_back_office_service_bus_nsip_project_update_topic_id"></a> [back\_office\_service\_bus\_nsip\_project\_update\_topic\_id](#input\_back\_office\_service\_bus\_nsip\_project\_update\_topic\_id) | ID for the nsip-project-update topic | `string`       | `""` | no |
| <a name="input_back_office_service_bus_register_nsip_subscription_topic_id"></a> [back\_office\_service\_bus\_register\_nsip\_subscription\_topic\_id](#input\_back\_office\_service\_bus\_register\_nsip\_subscription\_topic\_id) | ID for the register-nsip-subscription topic | `string`       | `""` | no |
| <a name="input_common_resource_group_name"></a> [common\_resource\_group\_name](#input\_common\_resource\_group\_name) | The common infrastructure resource group name | `string`       | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common resource tags for the project | `map(string)`  | n/a | yes |
| <a name="input_common_vnet_cidr_blocks"></a> [common\_vnet\_cidr\_blocks](#input\_common\_vnet\_cidr\_blocks) | A map of IP address blocks from the subnet name to the allocated CIDR prefix | `map(string)`  | n/a | yes |
| <a name="input_common_vnet_gateway_id"></a> [common\_vnet\_gateway\_id](#input\_common\_vnet\_gateway\_id) | The id of the common infrastructure virtual network gateway | `string`       | n/a | yes |
| <a name="input_common_vnet_id"></a> [common\_vnet\_id](#input\_common\_vnet\_id) | The common infrastructure virtual network id | `string`       | n/a | yes |
| <a name="input_common_vnet_name"></a> [common\_vnet\_name](#input\_common\_vnet\_name) | The common infrastructure virtual network name | `string`       | n/a | yes |
| <a name="input_container_registry_name"></a> [container\_registry\_name](#input\_container\_registry\_name) | The name of the container registry that hosts the image | `string`       | n/a | yes |
| <a name="input_container_registry_rg"></a> [container\_registry\_rg](#input\_container\_registry\_rg) | The resource group of the container registry that hosts the image | `string`       | n/a | yes |
| <a name="input_database_public_access_enabled"></a> [database\_public\_access\_enabled](#input\_database\_public\_access\_enabled) | Specifies whether sql db is exposed over internet or private network only | `bool`         | `false` | no |
| <a name="input_documents_host"></a> [documents\_host](#input\_documents\_host) | Specifies environment specific Wordpress CMS URL Prefix | `string`       | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string`       | n/a | yes |
| <a name="input_feature_allow_document_library"></a> [feature\_allow\_document\_library](#input\_feature\_allow\_document\_library) | Feature toggle for limiting the web app routes to document library | `string`       | n/a | yes |
| <a name="input_feature_allow_examination_timetable"></a> [feature\_allow\_examination\_timetable](#input\_feature\_allow\_examination\_timetable) | Feature toggle for the activation of examination timetable routes and links | `string`       | n/a | yes |
| <a name="input_feature_allow_get_updates"></a> [feature\_allow\_get\_updates](#input\_feature\_allow\_get\_updates) | Feature toggle for get updates | `string`       | n/a | yes |
| <a name="input_feature_allow_have_your_say"></a> [feature\_allow\_have\_your\_say](#input\_feature\_allow\_have\_your\_say) | Feature toggle to enable/disable have your say | `string`       | n/a | yes |
| <a name="input_feature_allow_project_information"></a> [feature\_allow\_project\_information](#input\_feature\_allow\_project\_information) | Feature toggle for project information | `string`       | n/a | yes |
| <a name="input_feature_allow_representation"></a> [feature\_allow\_representation](#input\_feature\_allow\_representation) | Feature toggle for limiting the web app routes to representation | `string`       | n/a | yes |
| <a name="input_feature_allow_section_51"></a> [feature\_allow\_section\_51](#input\_feature\_allow\_section\_51) | Feature toggle to section 51 | `string`       | n/a | yes |
| <a name="input_feature_enable_generalised_form_sanitisation"></a> [feature\_enable\_generalised\_form\_sanitisation](#input\_feature\_enable\_generalised\_form\_sanitisation) | Feature toggle to enable/disable generalised form sanitisation | `string`       | n/a | yes |
| <a name="input_feature_enabled_content_security_policy"></a> [feature\_enabled\_content\_security\_policy](#input\_feature\_enabled\_content\_security\_policy) | Feature toggle to enable/disable content security policy | `string`       | n/a | yes |
| <a name="input_feature_hide_project_timeline_link"></a> [feature\_hide\_project\_timeline\_link](#input\_feature\_hide\_project\_timeline\_link) | Feature toggle to show / hide the project timeline link on project overview nav bar | `string`       | n/a | yes |
| <a name="input_feature_redis_session_store"></a> [feature\_redis\_session\_store](#input\_feature\_redis\_session\_store) | Feature toggle for using redis to store session data as opposed to default in-memory store | `string`       | n/a | yes |
| <a name="input_feature_save_and_exit_option"></a> [feature\_save\_and\_exit\_option](#input\_feature\_save\_and\_exit\_option) | Feature toggle for showing the save and exit option on registration form | `string`       | n/a | yes |
| <a name="input_feature_show_affected_area_section"></a> [feature\_show\_affected\_area\_section](#input\_feature\_show\_affected\_area\_section) | Feature toggle for showing the affected area section on project page | `string`       | n/a | yes |
| <a name="input_function_storage_name"></a> [function\_storage\_name](#input\_function\_storage\_name) | Name of the Storage Account used for Function Apps | `string`       | n/a | yes |
| <a name="input_function_storage_primary_access_key"></a> [function\_storage\_primary\_access\_key](#input\_function\_storage\_primary\_access\_key) | Primary access key of the Storage Account used for Function Apps | `string`       | n/a | yes |
| <a name="input_google_analytics_id"></a> [google\_analytics\_id](#input\_google\_analytics\_id) | The id used to connect the frontend app to Google Analytics | `string`       | n/a | yes |
| <a name="input_instance"></a> [instance](#input\_instance) | The environment instance for use if multiple environments are deployed to a subscription | `string`       | `"001"` | no |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string`       | n/a | yes |
| <a name="input_is_dr_deployment"></a> [is\_dr\_deployment](#input\_is\_dr\_deployment) | A flag to indicate whether or not the infrastructure deployment is for a disaster recovery scenario | `bool`         | `false` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string`       | n/a | yes |
| <a name="input_key_vault_uri"></a> [key\_vault\_uri](#input\_key\_vault\_uri) | The URI of the Key Vault | `string`       | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location resources are deployed to in slug format e.g. 'uk-west' | `string`       | `"uk-south"` | no |
| <a name="input_logger_level"></a> [logger\_level](#input\_logger\_level) | The level of logging enabled for applications in the environment e.g. info | `string`       | `"info"` | no |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool`         | `false` | no |
| <a name="input_national_infrastructure_gateway_ip"></a> [national\_infrastructure\_gateway\_ip](#input\_national\_infrastructure\_gateway\_ip) | The public IP address of the National Infrastructure gateway endpoint | `string`       | n/a | yes |
| <a name="input_national_infrastructure_vnet_address_space"></a> [national\_infrastructure\_vnet\_address\_space](#input\_national\_infrastructure\_vnet\_address\_space) | The address space advertised by the National Infrastructure gateway endpoint | `list(string)` | n/a | yes |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string`       | `"development"` | no |
| <a name="input_private_beta_v1_routes_only"></a> [private\_beta\_v1\_routes\_only](#input\_private\_beta\_v1\_routes\_only) | Feature toggle for limiting web app routes to Private Beta V1 functionality only | `string`       | n/a | yes |
| <a name="input_private_endpoint_enabled"></a> [private\_endpoint\_enabled](#input\_private\_endpoint\_enabled) | A switch to determine if Private Endpoint should be enabled for backend App Services | `bool`         | `true` | no |
| <a name="input_sql_database_configuration"></a> [sql\_database\_configuration](#input\_sql\_database\_configuration) | A map of database configuration options | `map(string)`  | n/a | yes |
| <a name="input_sql_server_azuread_administrator"></a> [sql\_server\_azuread\_administrator](#input\_sql\_server\_azuread\_administrator) | Azure AD details of database administrator user/group | `map(string)`  | n/a | yes |
| <a name="input_srv_notify_base_url"></a> [srv\_notify\_base\_url](#input\_srv\_notify\_base\_url) | The base URL for the Notifications service | `string`       | n/a | yes |
| <a name="input_srv_notify_ip_registration_confirmation_email_to_ip_template_id"></a> [srv\_notify\_ip\_registration\_confirmation\_email\_to\_ip\_template\_id](#input\_srv\_notify\_ip\_registration\_confirmation\_email\_to\_ip\_template\_id) | The template ID for the IP registration confirmation email | `string`       | n/a | yes |
| <a name="input_srv_notify_magic_link_email_template_id"></a> [srv\_notify\_magic\_link\_email\_template\_id](#input\_srv\_notify\_magic\_link\_email\_template\_id) | The template ID for the magic link email | `string`       | n/a | yes |
| <a name="input_srv_notify_service_id"></a> [srv\_notify\_service\_id](#input\_srv\_notify\_service\_id) | The ID of the Notifications service | `string`       | n/a | yes |
| <a name="input_srv_notify_submission_complete_email_template_id"></a> [srv\_notify\_submission\_complete\_email\_template\_id](#input\_srv\_notify\_submission\_complete\_email\_template\_id) | The template ID for the submission complete email | `string`       | n/a | yes |
| <a name="input_srv_notify_subscription_create_email_template_id"></a> [srv\_notify\_subscription\_create\_email\_template\_id](#input\_srv\_notify\_subscription\_create\_email\_template\_id) | The template ID for the subscription create email | `string`       | n/a | yes |
| <a name="input_tooling_subscription_id"></a> [tooling\_subscription\_id](#input\_tooling\_subscription\_id) | The ID for the Tooling subscription that houses the Container Registry | `string`       | n/a | yes |
| <a name="input_project_migration_case_references"></a> [project\_migration\_case\_references](#project\_migration\_case\_references)                                                                                                              | Specifies the case references to migrate to the new project information page | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_urls"></a> [app\_service\_urls](#output\_app\_service\_urls) | A map of frontend app service URLs |
| <a name="output_web_frontend_url"></a> [web\_frontend\_url](#output\_web\_frontend\_url) | The URL of the web frontend app service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
