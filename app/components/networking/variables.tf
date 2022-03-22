variable "base_cidr_block" {
  description = "The CIDR address space for the virtual network"
  type        = string
}

variable "deploy_national_infrastructure_vnet_gateway" {
  description = "A flag to determine if the VNet gateway to the National Infrastructure subscription should be deployed"
  type        = bool
}

variable "location" {
  description = "The location resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain the App Services"
  type        = string
}

variable "resource_suffix" {
  description = "The suffix for resource naming"
  type        = string
}

variable "service_name" {
  description = "The name of the service the Azure App Services are part of"
  type        = string
}

variable "tags" {
  default     = {}
  description = "The tags applied to all resources"
  type        = map(string)
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

variable "tooling_subscription_id" {
  description = "The ID for the Tooling subscription that houses the Container Registry"
  type        = string
}
