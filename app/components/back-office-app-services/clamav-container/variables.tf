variable "back_office_clamav_subnet_id" {
  description = "Integration subnet for the clamav container"
  type        = string
}

variable "location" {
  description = "The name of the app service location"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_suffix" {
  description = "The suffix for resource naming"
  type        = string
}

variable "tags" {
  description = "The tags applied to all resources"
  type        = map(string)
}

variable "common_vnet_id" {
  description = "The common infrastructure virtual network id"
  type        = string
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}
