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
  description = "Frontend endpoints within the Front Door instance, mapped to resource ID"
  type        = map(string)
}

variable "use_managed_cert_map" {
  description = "A map of front end name to a boolean that represents if that front end should use an Azure managed SSL cert"
  type        = map(bool)
}
