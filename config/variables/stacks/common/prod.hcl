locals {
  alert_recipients = {
    low = [
      "Alexander.douglas@planninginspectorate.gov.uk",
      "anthony.walsh@planninginspectorate.gov.uk",
      "Gregg Barron@planninginspectorate.gov.uk",
      "john.roberts@planninginspectorate.gov.uk",
      "philip.philipou@planninginspectorate.gov.uk"
    ]
  }
  appeals_service_ssl_certificate_name      = "pins-wildcard"
  applications_service_ssl_certificate_name = "pins-wildcard"
  primary_vnet_address_space                = "10.3.0.0/16"
  secondary_vnet_address_space              = "10.13.0.0/16"
}
