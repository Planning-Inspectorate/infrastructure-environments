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
