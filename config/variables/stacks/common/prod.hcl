locals {
  alert_recipients = {
    low = [
      "chris.cundill@planninginspectorate.gov.uk",
      "elvin.ali@planninginspectorate.gov.uk",
      "pankaj.khare@planninginspectorate.gov.uk",
      "harish.kancharla@planninginspectorate.gov.uk"
    ]
  }
  appeals_service_ssl_certificate_name      = "pins-wildcard"
  applications_service_ssl_certificate_name = "pins-wildcard"
  primary_vnet_address_space                = "10.3.0.0/16"
  secondary_vnet_address_space              = "10.13.0.0/16"
}
