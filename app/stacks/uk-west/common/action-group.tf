resource "azurerm_monitor_action_group" "low" {
  name                = "pins-ag-low-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  short_name          = "pins-${var.environment}-low"
  tags                = local.tags

  email_receiver {
    name                    = "Send to Lester March"
    email_address           = "lester.march@kinandcarta.com"
    use_common_alert_schema = true
  }

  email_receiver {
    name                    = "Send to Chris Cundill"
    email_address           = "chris.cundill@planninginspectorate.gov.uk"
    use_common_alert_schema = true
  }

  email_receiver {
    name                    = "Send to Elvin Ali"
    email_address           = "elvin.ali@planninginspectorate.gov.uk"
    use_common_alert_schema = true
  }

  email_receiver {
    name                    = "Send to Pankaj Khare"
    email_address           = "pankaj.khare@planninginspectorate.gov.uk"
    use_common_alert_schema = true
  }

  email_receiver {
    name                    = "Send to Harish Kancharla"
    email_address           = "harish.kancharla@planninginspectorate.gov.uk"
    use_common_alert_schema = true
  }
}
