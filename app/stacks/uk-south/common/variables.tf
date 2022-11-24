variable "app_service_plan_sku" {
  default     = "P1v2"
  description = "The SKU of the App Service Plan"
  type        = string
}

variable "applications_service_vpn_gateway_shared_key" {
  description = "The applications service virtual network gateway shared key"
  sensitive   = true
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "cosmosdb_enable_public_access" {
  description = "A flag to indicate if the database can be accessed over the internet"
  type        = string
  default     = false
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}

variable "instance" {
  description = "The environment instance for use if multiple environments are deployed to a subscription"
  type        = string
  default     = "001"
}

variable "is_dr_deployment" {
  description = "A flag to indicate whether or not the infrastructure deployment is for a disaster recovery scenario"
  type        = bool
  default     = false
}

variable "location" {
  description = "The location resources are deployed to in slug format e.g. 'uk-west'"
  type        = string
  default     = "uk-south"
}

variable "secondary_vnet_address_space" {
  description = "The CIDR address space for the common virtual network"
  type        = string
}

variable "tooling_network_name" {
  description = "The name of the VNet in the Tooling environment"
  type        = string
}

variable "tooling_network_region_short" {
  description = "The region in which the Tooling VNet resides in short format e.g. 'uks'"
  type        = string
}

variable "tooling_network_rg" {
  description = "The name of the resource group containing the VNet in the Tooling environment"
  type        = string
}
