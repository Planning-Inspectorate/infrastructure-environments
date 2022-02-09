variable "app_name" {
  description = "The name of the app service"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "app_settings" {
  description = "The environment variables to be passed to the application"
  type        = map(string)
}

variable "container_image" {
  description = "The name of the image to be deployed to the app service"
  type        = string
}

variable "container_image_tag" {
  description = "The specific tag of the image to be deployed to the app service"
  type        = string
}

variable "container_registry_id" {
  description = "The id of the container registry that contains the image"
  type        = string
}

variable "container_registry_login_server" {
  description = "The URL that can be used to log into the container registry"
  type        = string
}

variable "enable_cd" {
  description = "Flag to enable Continuous Deployment on the app service"
  type        = bool
  default     = true
}

variable "location" {
  description = "The name of the app service location"
  type        = string
}

variable "prefix" {
  description = "The environment prefix used for resource naming"
  type        = string
}

variable "private_dns_zone_id" {
  description = "The id of the private dns zone for "
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The id of the subnet the app service is deployed in"
  type        = string
}

variable "tags" {
  description = "The tags applied to the resource"
  type        = map(string)
}

variable "virtual_network_id" {
  description = "The id of the VNet the app service is deployed in"
  type        = string
}
