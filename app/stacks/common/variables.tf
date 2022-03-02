variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "common_vnet_address_space" {
  description = "The CIDR address space for the common virtual network"
  type        = string
  default     = "10.0.0.0/16"
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

variable "region" {
  description = "The region resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-south"
}
