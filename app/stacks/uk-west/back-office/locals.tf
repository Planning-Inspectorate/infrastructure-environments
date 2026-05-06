locals {
  org          = "pins"
  service_name = "back-office"
  # TODO: Let's create database-specific users and passwords instead for connection strings
  # Also, let's store this in Key Vault rather than just spitting it into env variables!
  sql_server_username     = "backofficeadmin_${random_id.username_suffix.id}"
  sql_server_username_app = "backofficeapp_${random_id.username_suffix_app.id}"

  sql_connection_string = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name}",
      "database=${azurerm_mssql_database.back_office.name}",
      "user=${azurerm_mssql_server.back_office.administrator_login}",
      "password=${azurerm_mssql_server.back_office.administrator_login_password}",
      "trustServerCertificate=true"
    ]
  )
  sql_connection_string_app = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name}",
      "database=${azurerm_mssql_database.back_office.name}",
      "user=${local.sql_server_username_app}",
      "password=${random_password.back_office_sql_server_password_app.result}",
      "trustServerCertificate=true",
      var.environment == "prod" ? "connection_limit=10" : ""
    ]
  )

  resource_suffix = "${var.environment}-${module.azure_region_ukw.location_short}-${var.instance}"
  # keep the suffix short for training env, as it can only be upto 24 characters total for azurerm_storage_account
  storage_resource_suffix = var.environment == "training" ? "${var.environment}-${module.azure_region_ukw.location_short}" : local.resource_suffix

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_ukw.location
      ServiceName = local.service_name
    }
  )

  # action group keys from common/locals.tf all_action_groups
  # keys in this object used for alert name
  # max five action groups per alert
  sb_alerts = {
    # Common back office events
    "Back Office Events" = {
      topics = [
        var.sb_topic_names.common.service_user
      ],
      action_groups = [
        "applications-bo-tech",
        "data-tech"
      ]
    },
    # Applications front office submissions
    "Applications FO Submissions" = {
      topics = [
        var.sb_topic_names.applications.commands.register_nsip_subscription,
        var.sb_topic_names.applications.commands.register_representation,
        var.sb_topic_names.applications.commands.deadline_submission_topic,
        var.sb_topic_names.applications.commands.deadline_submission_result,
        var.sb_topic_names.applications.commands.dco_portal_data_submissions
      ],
      # could be back office or front office issue
      action_groups = [
        "applications-fo-tech",
        "applications-bo-tech",
        "applications-fo-service-manager",
        "applications-bo-service-manager"
      ]
    },
    # Applications back office events - recieved by front office
    "Applications BO Events (to FO, ODW)" = {
      topics = [
        var.sb_topic_names.applications.events.nsip_project,
        var.sb_topic_names.applications.events.nsip_project_update,
        var.sb_topic_names.applications.events.nsip_documents,
        var.sb_topic_names.applications.events.nsip_exam_timetable,
        var.sb_topic_names.applications.events.nsip_representation,
        var.sb_topic_names.applications.events.nsip_s51_advice
      ],
      # could be back office, front office, or ODW issue
      action_groups = [
        "applications-fo-tech",
        "applications-bo-tech",
        "applications-fo-service-manager",
        "applications-bo-service-manager",
        "data-service-manager"
      ]
    },
    # Applications back office events - ODW only
    "Applications BO Events (to ODW)" = {
      topics = [
        var.sb_topic_names.applications.events.folders,
        var.sb_topic_names.applications.events.nsip_subscription
      ],
      # could be back office or ODW issue
      action_groups = [
        "applications-bo-tech",
        "applications-bo-service-manager",
        "data-tech",
        "data-service-manager"
      ]
    }
  }
  bo_applications_tech_emails = [for rec in data.azurerm_monitor_action_group.bo_applications_tech.email_receiver : rec.email_address]
  tech_emails                 = local.bo_applications_tech_emails
  redaction_process_service_bus_subscribers = toset(
    [
      "cbos",
    ]
  )

  # Principal IDs of staging slot that require read secrets access to Key Vault. Linked to story DevOps Jira  #DEV-602
  staging_slot_read_secrets_principal_ids = {
    dev = {
      back_office_wfe = "49d7f503-7823-485c-aeda-738c9b118585"
      back_office_api = "ec2d534d-6871-4454-8b2d-4a759fcc193b"
    },
    test = {
      back_office_wfe = "143bf42c-efae-4812-835b-26cc4757d9b7"
      back_office_api = "ecf1064f-f382-4126-96c8-535e84b60cfe"
    },
    training = {
      back_office_wfe = "eabeb6fa-b2e4-4d73-b682-62527b3664d2"
      back_office_api = "cb9dd29e-7cc3-45dc-8050-d7c0750d0cc1"
    },
    prod = {
      back_office_wfe = "0a065567-b3ea-42e0-8bb4-24a67907f0c2"
      back_office_api = "07029e6d-afcb-47ce-8238-31e3ac976dad"
    }
  }
}
