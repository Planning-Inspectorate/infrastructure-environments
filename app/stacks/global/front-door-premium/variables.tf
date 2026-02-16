variable "action_group" {
  description = "The action group to use for alerts"
  type = object({
    name                = string
    resource_group_name = string
  })
  default = {
    name                = "pins-ag-odt-devops-tech-prod"
    resource_group_name = "pins-rg-common-prod-ukw-001"
  }
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}

variable "location" {
  description = "The location resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-south"
}

variable "log_daily_cap_gb" {
  description = "Daily log ingestion cap in GB"
  type        = number
}
