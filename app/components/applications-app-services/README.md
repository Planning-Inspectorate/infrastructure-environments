# Applications service App Services

This module contains the App Services resources for the applications service. These are placed in a sub-module as they need to be deployed to multiple Locations.

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
| <a name="module_azure_region"></a> [azure\_region](#module\_azure\_region) | claranet/regions/azurerm | 4.2.1 |
| <a name="module_back_office_subscribers"></a> [back\_office\_subscribers](#module\_back\_office\_subscribers) | github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app | 1.16 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_access_policy.bo_subscribers_read_secrets](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/key_vault_access_policy) | resource |
| [azurerm_role_assignment.back_office_app_send_deadline_submission_service_bus_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.back_office_app_send_register_representation](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.back_office_app_send_service_bus_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.back_office_deadline_documents_blob_storage_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_advice_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_advice_unpublish_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_document_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_document_unpublish_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_exam_timetable_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_exam_timetable_unpublish_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_project_unpublish_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_project_update_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_project_update_unpublish_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_representation_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_representation_update_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_service_user_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsip_service_user_unpublish_service_bus_role](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/role_assignment) | resource |
| [azurerm_servicebus_subscription.nsip_advice_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_advice_unpublish_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_document_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_document_unpublish_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_exam_timetable_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_exam_timetable_unpublish_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_project_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_project_unpublish_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_project_update_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_project_update_unpublish_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_representation_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_representation_update_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_service_user_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription.nsip_service_user_unpublish_topic_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription_rule.nsip_advice_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_advice_unpublish_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_document_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_document_unpublish_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_exam_timetable_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_exam_timetable_unpublish_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_project_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_project_unpublish_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_project_update_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_project_update_unpublish_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_representation_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_representation_update_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_service_user_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_servicebus_subscription_rule.nsip_service_user_unpublish_topic_subscription_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/servicebus_subscription_rule) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_ids"></a> [action\_group\_ids](#input\_action\_group\_ids) | The IDs of the Azure Monitor action groups for different alert types | <pre>object({<br>    tech            = string,<br>    service_manager = string,<br>    iap             = string,<br>    its             = string,<br>    info_sec        = string<br>  })</pre> | n/a | yes |
| <a name="input_activate_planned_outage"></a> [activate\_planned\_outage](#input\_activate\_planned\_outage) | A flag to indicate whether or not to activate the planned outage page | `bool` | `false` | no |
| <a name="input_api_timeout"></a> [api\_timeout](#input\_api\_timeout) | The timeout in milliseconds for API calls in the frontend apps | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The id of the app service plan | `string` | n/a | yes |
| <a name="input_app_service_private_dns_zone_id"></a> [app\_service\_private\_dns\_zone\_id](#input\_app\_service\_private\_dns\_zone\_id) | The id of the private DNS zone for App services | `string` | n/a | yes |
| <a name="input_applications_service_public_url"></a> [applications\_service\_public\_url](#input\_applications\_service\_public\_url) | The public URL for the Applications Service frontend web app | `string` | n/a | yes |
| <a name="input_applications_service_redis_connection_string_secret_name"></a> [applications\_service\_redis\_connection\_string\_secret\_name](#input\_applications\_service\_redis\_connection\_string\_secret\_name) | Name of the secret in Key Vault that stores the redis connection string | `string` | n/a | yes |
| <a name="input_back_office_integration_case_references"></a> [back\_office\_integration\_case\_references](#input\_back\_office\_integration\_case\_references) | list of case references (comma separated) that use back office | `string` | n/a | yes |
| <a name="input_back_office_integration_get_applications"></a> [back\_office\_integration\_get\_applications](#input\_back\_office\_integration\_get\_applications) | indicate if applications are retrieved from BO or NI or MERGE | `string` | n/a | yes |
| <a name="input_back_office_service_bus_deadline_submission_topic_id"></a> [back\_office\_service\_bus\_deadline\_submission\_topic\_id](#input\_back\_office\_service\_bus\_deadline\_submission\_topic\_id) | ID for the deadline-submission topic | `string` | n/a | yes |
| <a name="input_back_office_service_bus_namespace_name"></a> [back\_office\_service\_bus\_namespace\_name](#input\_back\_office\_service\_bus\_namespace\_name) | Namespace of Back Office Service Bus instance | `string` | n/a | yes |
| <a name="input_back_office_service_bus_nsip_advice_topic_id"></a> [back\_office\_service\_bus\_nsip\_advice\_topic\_id](#input\_back\_office\_service\_bus\_nsip\_advice\_topic\_id) | ID for the nsip-advice topic | `string` | n/a | yes |
| <a name="input_back_office_service_bus_nsip_document_topic_id"></a> [back\_office\_service\_bus\_nsip\_document\_topic\_id](#input\_back\_office\_service\_bus\_nsip\_document\_topic\_id) | ID for the nsip-document topic | `string` | n/a | yes |
| <a name="input_back_office_service_bus_nsip_exam_timetable_topic_id"></a> [back\_office\_service\_bus\_nsip\_exam\_timetable\_topic\_id](#input\_back\_office\_service\_bus\_nsip\_exam\_timetable\_topic\_id) | ID for the nsip-examination topic | `string` | n/a | yes |
| <a name="input_back_office_service_bus_nsip_project_topic_id"></a> [back\_office\_service\_bus\_nsip\_project\_topic\_id](#input\_back\_office\_service\_bus\_nsip\_project\_topic\_id) | ID for the nsip-project topic | `string` | n/a | yes |
| <a name="input_back_office_service_bus_nsip_project_update_topic_id"></a> [back\_office\_service\_bus\_nsip\_project\_update\_topic\_id](#input\_back\_office\_service\_bus\_nsip\_project\_update\_topic\_id) | ID for the nsip-project-update topic | `string` | n/a | yes |
| <a name="input_back_office_service_bus_nsip_representation_topic_id"></a> [back\_office\_service\_bus\_nsip\_representation\_topic\_id](#input\_back\_office\_service\_bus\_nsip\_representation\_topic\_id) | ID for the nsip-representation topic | `string` | n/a | yes |
| <a name="input_back_office_service_bus_nsip_service_user_topic_id"></a> [back\_office\_service\_bus\_nsip\_service\_user\_topic\_id](#input\_back\_office\_service\_bus\_nsip\_service\_user\_topic\_id) | ID for the nsip-service-user topic | `string` | n/a | yes |
| <a name="input_back_office_service_bus_register_nsip_subscription_topic_id"></a> [back\_office\_service\_bus\_register\_nsip\_subscription\_topic\_id](#input\_back\_office\_service\_bus\_register\_nsip\_subscription\_topic\_id) | ID for the register-nsip-subscription topic | `string` | n/a | yes |
| <a name="input_back_office_service_bus_register_representation_topic_id"></a> [back\_office\_service\_bus\_register\_representation\_topic\_id](#input\_back\_office\_service\_bus\_register\_representation\_topic\_id) | ID for the register-representation topic | `string` | n/a | yes |
| <a name="input_back_office_submissions_storage_account_name"></a> [back\_office\_submissions\_storage\_account\_name](#input\_back\_office\_submissions\_storage\_account\_name) | Back office submissions container storage\_account\_name | `string` | n/a | yes |
| <a name="input_back_office_submissions_storage_container_name"></a> [back\_office\_submissions\_storage\_container\_name](#input\_back\_office\_submissions\_storage\_container\_name) | URL for Back Office submissions storage container | `string` | n/a | yes |
| <a name="input_back_office_submissions_storage_container_resource_manager_id"></a> [back\_office\_submissions\_storage\_container\_resource\_manager\_id](#input\_back\_office\_submissions\_storage\_container\_resource\_manager\_id) | Back office submissions container resource\_manager\_id | `string` | n/a | yes |
| <a name="input_container_registry_name"></a> [container\_registry\_name](#input\_container\_registry\_name) | The name of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_container_registry_rg"></a> [container\_registry\_rg](#input\_container\_registry\_rg) | The resource group of the container registry that hosts the image | `string` | n/a | yes |
| <a name="input_documents_host"></a> [documents\_host](#input\_documents\_host) | Specifies environment specific Wordpress CMS URL Prefix | `string` | n/a | yes |
| <a name="input_endpoint_subnet_id"></a> [endpoint\_subnet\_id](#input\_endpoint\_subnet\_id) | The id of the private endpoint subnet the app service is linked to for ingress traffic | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_feature_allow_project_information"></a> [feature\_allow\_project\_information](#input\_feature\_allow\_project\_information) | Feature toggle for project information | `string` | n/a | yes |
| <a name="input_feature_allow_welsh_translation"></a> [feature\_allow\_welsh\_translation](#input\_feature\_allow\_welsh\_translation) | Feature toggle activating Welsh translation. | `string` | n/a | yes |
| <a name="input_feature_application_insights"></a> [feature\_application\_insights](#input\_feature\_application\_insights) | Feature toggle to enable/disable application insights | `string` | n/a | yes |
| <a name="input_feature_back_office_subscriber_enabled"></a> [feature\_back\_office\_subscriber\_enabled](#input\_feature\_back\_office\_subscriber\_enabled) | Temporary flag to enable/disable Back Office subscription integration. Always disabled for uk-south for now. | `bool` | `false` | no |
| <a name="input_feature_enable_generalised_form_sanitisation"></a> [feature\_enable\_generalised\_form\_sanitisation](#input\_feature\_enable\_generalised\_form\_sanitisation) | Feature toggle to enable/disable generalised form sanitisation | `string` | n/a | yes |
| <a name="input_feature_enabled_content_security_policy"></a> [feature\_enabled\_content\_security\_policy](#input\_feature\_enabled\_content\_security\_policy) | Feature toggle to enable/disable content security policy | `string` | n/a | yes |
| <a name="input_feature_general_s51_bo"></a> [feature\_general\_s51\_bo](#input\_feature\_general\_s51\_bo) | Feature toggle to enable/disable general s51 from back office | `string` | n/a | yes |
| <a name="input_feature_hide_project_timeline_link"></a> [feature\_hide\_project\_timeline\_link](#input\_feature\_hide\_project\_timeline\_link) | Feature toggle to show / hide the project timeline link on project overview nav bar | `string` | n/a | yes |
| <a name="input_feature_home_page"></a> [feature\_home\_page](#input\_feature\_home\_page) | Feature toggle to enable/disable routing to the home page | `string` | n/a | yes |
| <a name="input_feature_primary_navigation"></a> [feature\_primary\_navigation](#input\_feature\_primary\_navigation) | Feature toggle to enable/disable display of primary navigation | `string` | n/a | yes |
| <a name="input_feature_redis_session_store"></a> [feature\_redis\_session\_store](#input\_feature\_redis\_session\_store) | Feature toggle for using redis to store session data as opposed to default in-memory store | `string` | n/a | yes |
| <a name="input_feature_save_and_exit_option"></a> [feature\_save\_and\_exit\_option](#input\_feature\_save\_and\_exit\_option) | Feature toggle for showing the save and exit option on registration form | `string` | n/a | yes |
| <a name="input_feature_show_affected_area_section"></a> [feature\_show\_affected\_area\_section](#input\_feature\_show\_affected\_area\_section) | Feature toggle for showing the affected area section on project page | `string` | n/a | yes |
| <a name="input_function_storage_name"></a> [function\_storage\_name](#input\_function\_storage\_name) | Name of the Azure Storage Account for Function Apps | `string` | n/a | yes |
| <a name="input_function_storage_primary_access_key"></a> [function\_storage\_primary\_access\_key](#input\_function\_storage\_primary\_access\_key) | Access key for the Azure Storage Account for Function Apps | `string` | n/a | yes |
| <a name="input_google_analytics_id"></a> [google\_analytics\_id](#input\_google\_analytics\_id) | The id used to connect the frontend app to Google Analytics | `string` | n/a | yes |
| <a name="input_integration_subnet_id"></a> [integration\_subnet\_id](#input\_integration\_subnet\_id) | The id of the vnet integration subnet the app service is linked to for egress traffic | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault so the App Service can pull secret values | `string` | n/a | yes |
| <a name="input_key_vault_uri"></a> [key\_vault\_uri](#input\_key\_vault\_uri) | The URI of the Key Vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location the App Services are deployed to in slug format e.g. 'uk-south' | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Azure Monitor Log Analytics Workspace | `string` | n/a | yes |
| <a name="input_logger_level"></a> [logger\_level](#input\_logger\_level) | The level of logging enabled for applications in the environment e.g. info | `string` | `"info"` | no |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for App Service | `bool` | `false` | no |
| <a name="input_node_environment"></a> [node\_environment](#input\_node\_environment) | The node environment to be used for applications in this environment e.g. development | `string` | `"development"` | no |
| <a name="input_open_registration_case_references"></a> [open\_registration\_case\_references](#input\_open\_registration\_case\_references) | Case reference list for temporarily re-opened registrations period | `string` | n/a | yes |
| <a name="input_planned_outage_resume_text"></a> [planned\_outage\_resume\_text](#input\_planned\_outage\_resume\_text) | Optional text to be displayed when planned outage page is active | `string` | n/a | yes |
| <a name="input_private_endpoint_enabled"></a> [private\_endpoint\_enabled](#input\_private\_endpoint\_enabled) | A switch to determine if Private Endpoint should be enabled for backend App Services | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group that will contain the App Services | `string` | n/a | yes |
| <a name="input_resource_suffix"></a> [resource\_suffix](#input\_resource\_suffix) | The suffix for resource naming | `string` | n/a | yes |
| <a name="input_service_bus_config"></a> [service\_bus\_config](#input\_service\_bus\_config) | service bus configuration | <pre>object({<br>    default_topic_ttl            = string<br>    bo_internal_subscription_ttl = string<br>    bo_subscription_ttl          = string<br>    fo_subscription_ttl          = string<br>  })</pre> | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the service the Azure App Services are part of | `string` | n/a | yes |
| <a name="input_srv_notify_base_url"></a> [srv\_notify\_base\_url](#input\_srv\_notify\_base\_url) | The base URL for the Notifications service | `string` | n/a | yes |
| <a name="input_srv_notify_ip_registration_confirmation_email_to_ip_template_id"></a> [srv\_notify\_ip\_registration\_confirmation\_email\_to\_ip\_template\_id](#input\_srv\_notify\_ip\_registration\_confirmation\_email\_to\_ip\_template\_id) | The template ID for the IP registration confirmation email | `string` | n/a | yes |
| <a name="input_srv_notify_ip_registration_confirmation_email_to_ip_template_id_welsh"></a> [srv\_notify\_ip\_registration\_confirmation\_email\_to\_ip\_template\_id\_welsh](#input\_srv\_notify\_ip\_registration\_confirmation\_email\_to\_ip\_template\_id\_welsh) | The template ID for the IP registration confirmation email - bilingual for Welsh region projects | `string` | n/a | yes |
| <a name="input_srv_notify_service_id"></a> [srv\_notify\_service\_id](#input\_srv\_notify\_service\_id) | The ID of the Notifications service | `string` | n/a | yes |
| <a name="input_srv_notify_submission_complete_email_template_id"></a> [srv\_notify\_submission\_complete\_email\_template\_id](#input\_srv\_notify\_submission\_complete\_email\_template\_id) | The template ID for the submission complete email | `string` | n/a | yes |
| <a name="input_srv_notify_submission_complete_email_template_id_welsh"></a> [srv\_notify\_submission\_complete\_email\_template\_id\_welsh](#input\_srv\_notify\_submission\_complete\_email\_template\_id\_welsh) | The template ID for the submission complete email - bilingual for Welsh region projects | `string` | n/a | yes |
| <a name="input_srv_notify_subscription_create_email_template_id"></a> [srv\_notify\_subscription\_create\_email\_template\_id](#input\_srv\_notify\_subscription\_create\_email\_template\_id) | The template ID for the subscription create email | `string` | n/a | yes |
| <a name="input_srv_notify_subscription_create_email_template_id_welsh"></a> [srv\_notify\_subscription\_create\_email\_template\_id\_welsh](#input\_srv\_notify\_subscription\_create\_email\_template\_id\_welsh) | The template ID for the subscription create emai - bilingual for Welsh region projects | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags applied to all resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_principal_ids"></a> [app\_service\_principal\_ids](#output\_app\_service\_principal\_ids) | A map of App Service principal IDs |
| <a name="output_app_service_urls"></a> [app\_service\_urls](#output\_app\_service\_urls) | A map of App Service URLs |
| <a name="output_secret_names"></a> [secret\_names](#output\_secret\_names) | List of Key Vault secrets required for this component |
| <a name="output_web_frontend_url"></a> [web\_frontend\_url](#output\_web\_frontend\_url) | The URL of the web frontend App Service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
