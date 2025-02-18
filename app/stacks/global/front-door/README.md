# Front Door

This component contains the Azure Front Door and WAF resources. The resources in this stack are global.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.107.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.107.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_region_uks"></a> [azure\_region\_uks](#module\_azure\_region\_uks) | claranet/regions/azurerm | 4.2.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_frontdoor.common](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/frontdoor) | resource |
| [azurerm_frontdoor_firewall_policy.appeals_frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/frontdoor_firewall_policy) | resource |
| [azurerm_frontdoor_firewall_policy.back_office_applications_frontend](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/frontdoor_firewall_policy) | resource |
| [azurerm_frontdoor_firewall_policy.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/frontdoor_firewall_policy) | resource |
| [azurerm_frontdoor_rules_engine.search_indexing](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/frontdoor_rules_engine) | resource |
| [azurerm_monitor_diagnostic_setting.front_door_waf](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_scheduled_query_rules_alert_v2.appeals_waf_blocks](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/monitor_scheduled_query_rules_alert_v2) | resource |
| [azurerm_resource_group.frontdoor](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/resource_group) | resource |
| [null_resource.fd_routing_noindex](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appeals_service_primary_app_service_url"></a> [appeals\_service\_primary\_app\_service\_url](#input\_appeals\_service\_primary\_app\_service\_url) | The primary App Service URL for the Appeals Service | `string` | n/a | yes |
| <a name="input_appeals_service_public_url"></a> [appeals\_service\_public\_url](#input\_appeals\_service\_public\_url) | The public URL for the Appeals Service frontend web app | `string` | n/a | yes |
| <a name="input_appeals_service_secondary_app_service_url"></a> [appeals\_service\_secondary\_app\_service\_url](#input\_appeals\_service\_secondary\_app\_service\_url) | The secondary App Service URL for the Appeals Service | `string` | `""` | no |
| <a name="input_appeals_service_ssl_certificate_name"></a> [appeals\_service\_ssl\_certificate\_name](#input\_appeals\_service\_ssl\_certificate\_name) | The SSL certificate name in the environment Key Vault for the appeals service | `string` | `"pins-wildcard-cert-2025-01-02"` | no |
| <a name="input_applications_service_primary_app_service_url"></a> [applications\_service\_primary\_app\_service\_url](#input\_applications\_service\_primary\_app\_service\_url) | The primary App Service URL for the Applications Service | `string` | n/a | yes |
| <a name="input_applications_service_public_url"></a> [applications\_service\_public\_url](#input\_applications\_service\_public\_url) | The public URL for the Applications Service frontend web app | `string` | n/a | yes |
| <a name="input_applications_service_secondary_app_service_url"></a> [applications\_service\_secondary\_app\_service\_url](#input\_applications\_service\_secondary\_app\_service\_url) | The secondary App Service URL for the Applications Service | `string` | `""` | no |
| <a name="input_applications_service_ssl_certificate_name"></a> [applications\_service\_ssl\_certificate\_name](#input\_applications\_service\_ssl\_certificate\_name) | The SSL certificate name in the environment Key Vault for the applications service | `string` | `"unused"` | no |
| <a name="input_back_office_primary_app_service_url"></a> [back\_office\_primary\_app\_service\_url](#input\_back\_office\_primary\_app\_service\_url) | The primary App Service URL for the Back Office | `string` | n/a | yes |
| <a name="input_back_office_public_url"></a> [back\_office\_public\_url](#input\_back\_office\_public\_url) | The public URL for the Back Office frontend web app | `string` | n/a | yes |
| <a name="input_back_office_public_url_new"></a> [back\_office\_public\_url\_new](#input\_back\_office\_public\_url\_new) | The new public URL for the Back Office frontend web app | `string` | `null` | no |
| <a name="input_back_office_secondary_app_service_url"></a> [back\_office\_secondary\_app\_service\_url](#input\_back\_office\_secondary\_app\_service\_url) | The secondary App Service URL for the Back Office | `string` | `""` | no |
| <a name="input_back_office_ssl_certificate_name"></a> [back\_office\_ssl\_certificate\_name](#input\_back\_office\_ssl\_certificate\_name) | The SSL certificate name in the environment Key Vault for the back office service | `string` | `"unused"` | no |
| <a name="input_common_log_analytics_workspace_id"></a> [common\_log\_analytics\_workspace\_id](#input\_common\_log\_analytics\_workspace\_id) | The ID for the common Log Analytics Workspace | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common resource tags for the project | `map(string)` | n/a | yes |
| <a name="input_enable_search_indexing_by_default"></a> [enable\_search\_indexing\_by\_default](#input\_enable\_search\_indexing\_by\_default) | A flag to indicate if the environment should enable search indexing for frontends by default | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_feature_front_door_failover_enaled"></a> [feature\_front\_door\_failover\_enaled](#input\_feature\_front\_door\_failover\_enaled) | Whether or not the backend pools should be created with both the primary and secondary app service urls. This feature flag is temporary. | `bool` | `false` | no |
| <a name="input_front_door_waf_appeals_redirect_path"></a> [front\_door\_waf\_appeals\_redirect\_path](#input\_front\_door\_waf\_appeals\_redirect\_path) | The URL to redirect a user to if a rule's action is Redirect | `string` | n/a | yes |
| <a name="input_front_door_waf_mode"></a> [front\_door\_waf\_mode](#input\_front\_door\_waf\_mode) | Indicates if the Web Application Firewall should be in Detection or Prevention mode | `string` | `"Detection"` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | The environment instance for use if multiple environments are deployed to a subscription | `string` | `"001"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location resources are deployed to in slug format e.g. 'uk-west' | `string` | `"uk-west"` | no |
| <a name="input_monitoring_alerts_enabled"></a> [monitoring\_alerts\_enabled](#input\_monitoring\_alerts\_enabled) | Indicates whether Azure Monitor alerts are enabled for Front Door | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontend_endpoint_mappings"></a> [frontend\_endpoint\_mappings](#output\_frontend\_endpoint\_mappings) | A map of maps containing configuration options for each frontend endpoint |
| <a name="output_frontend_endpoints"></a> [frontend\_endpoints](#output\_frontend\_endpoints) | A map of frontend endpoints within the Front Door instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
