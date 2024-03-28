variable "appeals_back_office_service_name" {
  description = "The service name used for appeals back office"
  type        = string
  default     = "appeals-back-office"
}

variable "back_office_appeals_public_url" {
  description = "The public URL for the Back Office Appeals frontend web app"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

# variable "enable_search_indexing_by_default" {
#   description = "A flag to indicate if the environment should enable search indexing for frontends by default"
#   type        = bool
#   default     = false
# }

# variable "common_log_analytics_workspace_id" {
#   description = "The ID for the common Log Analytics Workspace"
#   type        = string
# }

variable "location" {
  description = "The location the App Services are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uksouth"
}

variable "published_documents_blob_storage_endpoint" {
  description = "Published documents blob endpoint"
  type        = string
}

variable "back_office_published_documents_domain" {
  description = "Domain for published documents"
  type        = string
}

variable "back_office_appeals_primary_app_service_url" {
  description = "The primary App Service URL for the Back Office Appeals"
  type        = string
}

variable "origin" {
  description = "CDN FrontDoor Origins configurations."
  type = map(object({
    name                           = string
    custom_resource_name           = optional(string)
    origin_group_name              = string
    enabled                        = optional(bool, true)
    certificate_name_check_enabled = optional(bool, true)

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

variable "route" {
  description = "CDN FrontDoor Routes configurations."
  type = map(object({
    name                 = string
    custom_resource_name = optional(string)
    enabled              = optional(bool, true)

    forwarding_protocol = optional(string, "MatchRequest")
    patterns_to_match   = optional(list(string), ["/*"])
    supported_protocols = optional(list(string), ["Https"])
    cache = optional(object({
      query_string_caching_behavior = optional(string, "IgnoreQueryString")
      query_strings                 = optional(list(string))
      compression_enabled           = optional(bool, false)
      content_types_to_compress     = optional(list(string))
    }))

    custom_domains_names = optional(list(string), [])
    origin_path          = optional(string)
    rule_sets_names      = optional(list(string), [])

    https_redirect_enabled = optional(bool, true)
    link_to_default_domain = optional(bool, true)
  }))
}
