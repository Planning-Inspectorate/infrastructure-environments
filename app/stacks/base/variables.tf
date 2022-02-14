variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "region" {
  description = "The region resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-south"
}
