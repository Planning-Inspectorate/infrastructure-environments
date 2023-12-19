variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority (P4) alerts"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "azuread_auth_client_id" {
  description = "The Back Office web frontend app registration ID used for Azure AD authentication"
  type        = string
  default     = null
}

variable "azuread_appeals_case_officer_group_id" {
  description = "The Azure AD group ID for Appeals Back Office case officers"
  type        = string
  default     = null
}

variable "azuread_appeals_inspector_group_id" {
  description = "The Azure AD group ID for Appeals Back Office inspectors"
  type        = string
  default     = null
}

variable "azuread_appeals_cs_team_group_id" {
  description = "The Azure AD group ID for Appeals Back Office CS Team"
  type        = string
  default     = null
}

variable "azuread_appeals_legal_team_group_id" {
  description = "The Azure AD group ID for Appeals Back Office Legal Team"
  type        = string
  default     = null
}


variable "azuread_applications_caseteam_group_id" {
  description = "The Azure AD group ID for Applications Back Office case team"
  type        = string
  default     = null
}

variable "azuread_applications_inspector_group_id" {
  description = "The Azure AD group ID for Applications Back Office inspectors"
  type        = string
  default     = null
}

variable "azuread_applications_case_admin_officer_group_id" {
  description = "The Azure AD group ID for Applications Back Office case admin officers"
  type        = string
  default     = null
}

variable "back_office_integration_subnet_id" {
  description = "Integration subnet for back office anti-virus resources"
  type        = string
}

variable "back_office_clamav_subnet_id" {
  description = "Integration subnet for the clamav container"
  type        = string
}

variable "back_office_public_url" {
  description = "The public URL for the Back Office frontend web app"
  type        = string
}

variable "back_office_appeals_public_url" {
  description = "The public URL for the Back Office Appeals frontend web app"
  type        = string
}

variable "cdn_frontdoor_origin_path" {
  description = "A directory path on the Front Door Origin that can be used to retrieve content"
  type        = string
}

variable "common_log_analytics_workspace_id" {
  description = "The ID for the common Log Analytics Workspace"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "common_resource_group_name" {
  description = "The common infrastructure resource group name"
  type        = string
}

variable "common_vnet_cidr_blocks" {
  description = "A map of IP address blocks from the subnet name to the allocated CIDR prefix"
  type        = map(string)
}

variable "common_vnet_id" {
  description = "The common infrastructure virtual network id"
  type        = string
}

variable "common_vnet_name" {
  description = "The common infrastructure virtual network name"
  type        = string
}

variable "container_registry_name" {
  description = "The name of the container registry that hosts the image"
  type        = string
}

variable "container_registry_rg" {
  description = "The resource group of the container registry that hosts the image"
  type        = string
}

variable "database_public_access_enabled" {
  description = "A switch indicating if databases should have public access enabled"
  type        = bool
  default     = false
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}

variable "health_check_path" {
  description = "The path of the service's health check endpoint"
  type        = string
  default     = "/health"
}

variable "host_name" {
  description = "The host name of the resource"
  type        = string
}

variable "instance" {
  description = "The environment instance for use if multiple environments are deployed to a subscription"
  type        = string
  default     = "001"
}

variable "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the key vault so the App Service can pull secret values"
  type        = string
}

variable "key_vault_uri" {
  description = "The URI of the Key Vault"
  type        = string
}

variable "location" {
  description = "The location resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-west"
}

variable "monitoring_alerts_enabled" {
  default     = false
  description = "Indicates whether Azure Monitor alerts are enabled for App Service"
  type        = bool
}

variable "name" {
  description = "The name of the resource"
  type        = string
}

variable "node_environment" {
  description = "The node environment to be used for applications in this environment e.g. development"
  type        = string
  default     = "development"
}

variable "private_endpoint_enabled" {
  description = "A switch to determine if Private Endpoint should be enabled for backend App Services"
  type        = bool
  default     = true
}

variable "service_bus_failover_enabled" {
  default     = false
  description = "A switch to determine if Service Bus failover is enabled requiring the Premium SKU"
  type        = bool
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "service_name" {
  description = "The name of the service the Front Door belongs to"
  type        = string
}

variable "sql_database_configuration" {
  description = "A map of database configuration options"
  type        = map(string)
}

variable "sql_server_azuread_administrator" {
  description = "A map describing the AzureAD account used for the SQL server administrator"
  type        = map(string)
}

variable "feature_service_bus_enabled" {
  description = "Whether or not Service Bus events are enabled"
  type        = string
}

variable "feature_document_scanning_enabled" {
  description = "Whether or not Document Scanning is enabled"
  type        = bool
}

variable "notify_subscribers_function_gov_notify_template_id" {
  description = "Notify Subscribers Function - GovNotify Template ID"
  type        = string
}

variable "applications_front_office_web_url" {
  description = "Applications Front Office Web URL"
  type        = string
}

variable "back_office_applications_log_level_file" {
  description = "Log level for the server.log file - trace, debug, info, warn, error, fatal, silent"
  type        = string
}

variable "back_office_applications_log_level_stdout" {
  description = "Log level for stdout - trace, debug, info, warn, error, fatal, silent"
  type        = string
}

variable "back_office_appeals_log_level_file" {
  description = "Log level for the server.log file - trace, debug, info, warn, error, fatal, silent"
  type        = string
}

variable "back_office_appeals_log_level_stdout" {
  description = "Log level for stdout - trace, debug, info, warn, error, fatal, silent"
  type        = string
}

variable "redis_cache_configuration" {
  description = "A map of redis configuration options"
  type        = map(string)
}

variable "odw_synapse_integration_enabled" {
  description = "Whether or not Synapse Migration Integration is enabled"
  type        = bool
  default     = false
}

variable "endpoints" {
  description = "CDN FrontDoor Endpoints configurations."
  type = map(object({
    name                     = string
    origin_group_name        = optional(string)
    prefix                   = optional(string)
    custom_resource_name     = optional(string)
    session_affinity_enabled = optional(bool, true)
    forwarding_protocol      = optional(string)
    patterns_to_match        = optional(map(string))
    accepted_protocols       = optional(map(string))
    origin_path              = optional(string)
    https_redirect_enabled   = optional(bool)
    link_to_default_domain   = optional(bool)
    custom_domains           = optional(list(string))

    tags = optional(map(string))
  }))
  default = {}
}

variable "origin_groups" {
  description = "CDN FrontDoor Origin Groups configurations."
  type = map(object({
    name                                                      = optional(string)
    custom_resource_name                                      = optional(string)
    session_affinity_enabled                                  = optional(bool, false)
    restore_traffic_time_to_healed_or_new_endpoint_in_minutes = optional(number, 10)
    load_balancing = optional(object({
      sample_size                        = optional(number, 4)
      successful_samples_required        = optional(number, 2)
      additional_latency_in_milliseconds = optional(number, 0)
    }), {})
    health_probe = optional(object({
      path                = optional(string, "/")
      protocol            = optional(string, "Http")
      request_type        = optional(string, "GET")
      interval_in_seconds = optional(number, 120)
    }))
  }))
  default = {}
}

variable "origins" {
  description = "CDN FrontDoor Origins configurations."
  type = map(object({
    name                           = optional(string)
    custom_resource_name           = optional(string)
    origin_group_name              = string
    enabled                        = optional(bool, true)
    certificate_name_check_enabled = optional(bool, false)

    host_name          = string
    http_port          = optional(number, 80)
    https_port         = optional(number, 443)
    origin_host_header = optional(string)
    priority           = optional(number, 5)
    weight             = optional(number, 100)

    private_link = optional(object({
      request_message        = optional(string)
      target_type            = optional(string)
      location               = string
      private_link_target_id = string
    }))
  }))
  default = {}
}

variable "routes" {
  description = "CDN FrontDoor Routes configurations."
  type = map(object({
    name                 = string
    custom_resource_name = optional(string)
    enabled              = optional(bool, true)

    endpoint_name     = string
    origin_group_name = string
    origins_names     = list(string)

    # forwarding_protocol = optional(string, "MatchRequest")
    # patterns_to_match   = optional(list(string), ["/*"])
    # supported_protocols = optional(list(string), ["Http", "Https"])
    # cache = optional(object({
    #   query_string_caching_behavior = optional(string, "IgnoreQueryString")
    #   query_strings                 = optional(list(string))
    #   compression_enabled           = optional(bool, false)
    #   content_types_to_compress     = optional(list(string))
    # }))

    # custom_domains_names = optional(list(string), [])
    # origin_path          = optional(string, "/")
    # rule_sets_names      = optional(list(string), [])

    # https_redirect_enabled = optional(bool, true)
    # link_to_default_domain = optional(bool, true)
  }))
}

variable "custom_domain" {
  description = "Front Door Custom Domains"
  type = map(object({
    name        = string
    host_name   = string
    dns_zone_id = optional(string)

    # tls = optional(object({
    #   certificate_type    = optional(string, "ManagedCertificate")
    #   minimum_tls_version = optional(string, "TLS12")
    # }))
  }))
}


# variable "endpoints" {
#   description = "CDN FrontDoor Endpoints configurations."
#   type = map(object({
#     back_office_appeals = {
#       name                     = string
#       origin_group_name        = optional(string)
#       prefix                   = optional(string)
#       custom_resource_name     = optional(string)
#       session_affinity_enabled = optional(bool, true)
#       forwarding_protocol      = optional(string)
#       patterns_to_match        = optional(map(string))
#       accepted_protocols       = optional(map(string))
#       origin_path              = optional(string)
#       https_redirect_enabled   = optional(bool)
#       link_to_default_domain   = optional(bool)
#       custom_domains           = optional(list(string))

#       tags = optional(map(string))
#     }
#   }))
# }

# variable "origin_groups" {
#   description = "CDN FrontDoor Origin Groups configurations."
#   type = map(object({
#     back_office_appeals = {
#       name                                                      = string
#       custom_resource_name                                      = optional(string)
#       session_affinity_enabled                                  = optional(bool, false)
#       restore_traffic_time_to_healed_or_new_endpoint_in_minutes = optional(number, 10)
#       load_balancing = optional(object({
#         sample_size                        = optional(number, 4)
#         successful_samples_required        = optional(number, 2)
#         additional_latency_in_milliseconds = optional(number, 0)
#       }), {})
#       health_probe = optional(object({
#         path                = optional(string, "/")
#         protocol            = optional(string, "Http")
#         request_type        = optional(string, "GET")
#         interval_in_seconds = optional(number, 120)
#       }))
#     }
#   }))
# }


# variable "origins" {
#   description = "CDN FrontDoor Origins configurations."
#   type = map(object({
#     back_office_appeals = {
#       name                           = string
#       custom_resource_name           = optional(string)
#       origin_group_name              = string
#       enabled                        = optional(bool, true)
#       certificate_name_check_enabled = optional(bool, false)

#       host_name          = string
#       http_port          = optional(number, 80)
#       https_port         = optional(number, 443)
#       origin_host_header = optional(string)
#       priority           = optional(number, 5)
#       weight             = optional(number, 100)

#       private_link = optional(object({
#         request_message        = optional(string)
#         target_type            = optional(string)
#         location               = string
#         private_link_target_id = string
#       }))
#     }
#   }))
# }

# variable "routes" {
#   description = "CDN FrontDoor Routes configurations."
#   type = map(object({
#     back_office_appeals = {
#       name                 = string
#       custom_resource_name = optional(string)
#       enabled              = optional(bool, true)

#       endpoint_name     = string
#       origin_group_name = string
#       origins_names     = list(string)

#       forwarding_protocol = optional(string, "MatchRequest")
#       patterns_to_match   = optional(list(string), ["/*"])
#       supported_protocols = optional(list(string), ["Http", "Https"])
#       cache = optional(object({
#         query_string_caching_behavior = optional(string, "IgnoreQueryString")
#         query_strings                 = optional(list(string))
#         compression_enabled           = optional(bool, false)
#         content_types_to_compress     = optional(list(string))
#       }))

#       custom_domains_names = optional(list(string), [])
#       origin_path          = optional(string, "/")
#       rule_sets_names      = optional(list(string), [])

#       https_redirect_enabled = optional(bool, true)
#       link_to_default_domain = optional(bool, true)
#     }
#   }))
# }

# variable "custom_domain" {
#   description = "Front Door Custom Domains"
#   type = map(object({
#     back_office_appeals = {
#       name        = string
#       host_name   = string
#       dns_zone_id = optional(string)
#     }
#   }))
# }
