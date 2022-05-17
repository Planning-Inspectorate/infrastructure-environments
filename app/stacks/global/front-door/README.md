# Front Door

This component contains the Azure Front Door and WAF resources. The resources in this stack are global.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_region_uks"></a> [azure\_region\_uks](#module\_azure\_region\_uks) | claranet/regions/azurerm | 4.2.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_frontdoor.common](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/frontdoor) | resource |
| [azurerm_frontdoor_firewall_policy.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/frontdoor_firewall_policy) | resource |
| [azurerm_monitor_diagnostic_setting.front_door_waf](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_resource_group.frontdoor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_urls"></a> [app\_service\_urls](#input\_app\_service\_urls) | A map of App Service service URLs | `map(string)` | n/a | yes |
| <a name="input_appeals_service_public_url"></a> [appeals\_service\_public\_url](#input\_appeals\_service\_public\_url) | The public URL for the Appeals Service frontend web app | `string` | n/a | yes |
| <a name="input_appeals_service_ssl_certificate_name"></a> [appeals\_service\_ssl\_certificate\_name](#input\_appeals\_service\_ssl\_certificate\_name) | The SSL certificate name in the environment Key Vault for the appeals service | `string` | `null` | no |
| <a name="input_applications_service_public_url"></a> [applications\_service\_public\_url](#input\_applications\_service\_public\_url) | The public URL for the Applications Service frontend web app | `string` | n/a | yes |
| <a name="input_applications_service_ssl_certificate_name"></a> [applications\_service\_ssl\_certificate\_name](#input\_applications\_service\_ssl\_certificate\_name) | The SSL certificate name in the environment Key Vault for the applications service | `string` | `null` | no |
| <a name="input_back_office_public_url"></a> [back\_office\_public\_url](#input\_back\_office\_public\_url) | The public URL for the Back Office frontend web app | `string` | n/a | yes |
| <a name="input_back_office_ssl_certificate_name"></a> [back\_office\_ssl\_certificate\_name](#input\_back\_office\_ssl\_certificate\_name) | The SSL certificate name in the environment Key Vault for the back office service | `string` | `null` | no |
| <a name="input_common_log_analytics_workspace_id"></a> [common\_log\_analytics\_workspace\_id](#input\_common\_log\_analytics\_workspace\_id) | The ID for the common Log Analytics Workspace | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common resource tags for the project | `map(string)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment resources are deployed to e.g. 'dev' | `string` | n/a | yes |
| <a name="input_front_door_waf_mode"></a> [front\_door\_waf\_mode](#input\_front\_door\_waf\_mode) | Indicates if the Web Application Firewall should be in Detection or Prevention mode | `string` | `"Detection"` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | The environment instance for use if multiple environments are deployed to a subscription | `string` | `"001"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location resources are deployed to in slug format e.g. 'uk-west' | `string` | `"uk-west"` | no |
| <a name="input_use_wildcard_certificate"></a> [use\_wildcard\_certificate](#input\_use\_wildcard\_certificate) | A flag to indicate if Frontdoor should use the provisioned wildcard certificate | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontend_endpoint_mappings"></a> [frontend\_endpoint\_mappings](#output\_frontend\_endpoint\_mappings) | A map of maps containing configuration options for each frontend endpoint |
| <a name="output_frontend_endpoints"></a> [frontend\_endpoints](#output\_frontend\_endpoints) | A map of frontend endpoints within the Front Door instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
