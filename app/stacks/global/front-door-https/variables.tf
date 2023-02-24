variable "common_key_vault_id" {
  description = "The ID of the common environment Key Vault that contains SSL certificates"
  type        = string
}

variable "frontend_endpoint_mappings" {
  description = "A map of maps containing configuration options for each frontend endpoint"
  type = map(object({
    frontend_name        = string
    frontend_endpoint    = string
    patterns_to_match    = list(string)
    ssl_certificate_name = string
  }))
}

variable "frontend_endpoints" {
  description = "A map of frontend endpoints within the Front Door instance"
  type        = map(string)
}
