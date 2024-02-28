locals {
  alert_recipients = {
    low = [
      "benjamin.jacobs@planninginspectorate.gov.uk",
      "anthony.walsh@planninginspectorate.gov.uk",
      "david.white@planninginspectorate.gov.uk",
      "emil.placheta@planninginspectorate.gov.uk",
      "philip.philippou@planninginspectorate.gov.uk"
    ]
  }
  primary_vnet_address_space   = "10.1.0.0/16"
  secondary_vnet_address_space = "10.11.0.0/16"
  create_turbrepo_cache        = false
}
