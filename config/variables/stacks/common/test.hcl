locals {
  alert_recipients = {
    low = [
      "benjamin.jacobs@planninginspectorate.gov.uk",
      "anthony.walsh@planninginspectorate.gov.uk",
      "david.whiten@planninginspectorate.gov.uk",
      "emil.placheta@planninginspectorate.gov.uk",
      "philip.philippou@planninginspectorate.gov.uk"
    ]
  }
  appeals_service_ssl_certificate_name      = "pins-wildcard-cert-2025-01-02"
  applications_service_ssl_certificate_name = "pins-wildcard-cert-2025-01-02"
  primary_vnet_address_space                = "10.2.0.0/16"
  secondary_vnet_address_space              = "10.12.0.0/16"
  create_turbrepo_cache                     = false
}
