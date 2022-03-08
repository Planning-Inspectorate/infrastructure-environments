variable "common_resource_group_name" {
  description = "The common infrastructure resource group name"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
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

variable "ni_frontend_url" {
  description = "The URL of the applications service national infrastructure frontend app service"
  type        = string
}

variable "region" {
  description = "The region resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-south"
}
