variable "common_key_vault_id" {
  description = "The ID of the common environment Key Vault that contains SSL certificates"
  type        = string
}

variable "frontend_endpoint_mappings" {
  description = "A map of maps containing configuration options for each frontend endpoint"
  type        = map(map(any))
}

variable "frontend_endpoints" {
  description = "A map of frontend endpoints within the Front Door instance"
  type        = map(string)
}
