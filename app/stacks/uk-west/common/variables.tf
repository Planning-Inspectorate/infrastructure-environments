variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}

variable "front_door_principal_id" {
  description = "The ID of the service principal associated with Front Door in the tenant"
  type        = string
}

variable "instance" {
  description = "The environment instance for use if multiple environments are deployed to a subscription"
  type        = string
  default     = "001"
}

variable "location" {
  description = "The location resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-west"
}

variable "primary_vnet_address_space" {
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

variable "tooling_subscription_id" {
  description = "The ID for the Tooling subscription that houses the Container Registry"
  type        = string
}
