# variable "common_log_analytics_workspace_id" {
#   description = "The ID for the common Log Analytics Workspace"
#   type        = string
# }

variable "blob_storage_endpoint" {
  description = "The endpoint for the blob storage"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "domain_name" {
  description = "Public domain name"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

variable "location" {
  description = "The location the App Services are deployed to in slug format e.g. 'uk-south'"
  type        = string
}

variable "name" {
  description = "The name of the resource"
  type        = string
}

variable "service_name" {
  description = "Public domain name"
  type        = string
}

# variable "storage_account_id" {
#   description = "The id of the Storage Accounts are to enable private link."
#   type        = string
# }

variable "sku_name" {
  description = "Specifies the SKU for this Front Door Profile."
  type        = string
}
