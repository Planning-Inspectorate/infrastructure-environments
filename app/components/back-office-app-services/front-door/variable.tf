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

variable "host_name" {
  description = "The host name of the resource"
  type        = string
}

variable "name" {
  description = "The name of the resource"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "service_name" {
  description = "The name of the service the Front Door belongs to"
  type        = string
}

variable "tooling_subscription_id" {
  description = "The ID for the Tooling subscription that houses the Container Registry"
  type        = string
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
    name                                                      = string
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
    name                           = string
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

    forwarding_protocol = optional(string, "MatchRequest")
    patterns_to_match   = optional(list(string), ["/*"])
    supported_protocols = optional(list(string), ["Http", "Https"])
    cache = optional(object({
      query_string_caching_behavior = optional(string, "IgnoreQueryString")
      query_strings                 = optional(list(string))
      compression_enabled           = optional(bool, false)
      content_types_to_compress     = optional(list(string))
    }))

    custom_domains_names = optional(list(string), [])
    origin_path          = optional(string, "/")
    rule_sets_names      = optional(list(string), [])

    https_redirect_enabled = optional(bool, true)
    link_to_default_domain = optional(bool, true)
  }))
}

variable "custom_domain" {
  description = "Front Door Custom Domains"
  type = map(object({
    name        = string
    host_name   = string
    dns_zone_id = optional(string)

    tls = optional(object({
      certificate_type    = optional(string, "ManagedCertificate")
      minimum_tls_version = optional(string, "TLS12")
    }))
  }))
}
