locals {
  frontend_mappings = {
    default = {
      name              = "pins-fd-${local.service_name}-${local.resource_suffix}"
      frontend_endpoint = "pins-fd-${local.service_name}-${local.resource_suffix}.azurefd.net"
      patterns_to_match = ["/*"]
    }
    national_infrastructure_frontend = {
      name              = "NationalInfrastructure"
      frontend_endpoint = var.applications_service_public_url
      patterns_to_match = ["/*"]
    }
    appeals_service_frontend = {
      name              = "AppealsService"
      frontend_endpoint = var.appeals_service_public_url
      patterns_to_match = ["/*"]
    }
    # lpa_questionnaire_frontend = {
    #   name              = "LpaQuestionnaire"
    #   frontend_endpoint = var.lpa_questionnaire_public_url
    #   patterns_to_match = ["/*"]
    # }
  }
  service_name    = "front-door"
  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  tags = merge(
    var.common_tags,
    {
      Region      = var.region
      ServiceName = local.service_name
    }
  )
}
