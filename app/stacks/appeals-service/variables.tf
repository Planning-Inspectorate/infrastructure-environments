variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "container_registry_name" {
  description = "The name of the container registry that hosts the image"
  type        = string
}

variable "container_registry_rg" {
  description = "The resource group of the container registry that hosts the image"
  type        = string
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}

variable "mongodb_url" {
  description = "The URL used to connect to MongoDB"
  type        = string
}

variable "region" {
  description = "The region resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-south"
}
