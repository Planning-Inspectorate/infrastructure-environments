locals {
  app_service_principal_id                          = "c1dc4452-3f0f-4e5e-9c64-9be49eac75f4"
  container_registry_name                           = "pinscrsharedtoolinguks"
  container_registry_rg                             = "pins-rg-shared-tooling-uks"
  app_service_private_dns_zone_id                   = "/subscriptions/${local.tooling_subscription_id}/resourceGroups/${local.tooling_network_rg}/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"
  front_door_principal_id                           = "c73a3f61-aa0a-4450-b3f8-303d72bf57a9"
  internal_dns_name                                 = "pins.internal"
  pipeline_appeals_service_principal_object_id      = "11ed006b-0bff-4b2c-b866-503bd6affc1d"
  pipeline_applications_service_principal_object_id = "1634ca70-4e44-41d7-8508-74055051ab91"
  pipeline_back_office_principal_object_id          = "d7a421f4-c539-4ee4-b1a2-a6a2f70cf4c9"
  tooling_key_vault_id                              = "/subscriptions/${local.tooling_subscription_id}/resourceGroups/${local.tooling_network_rg}/providers/Microsoft.KeyVault/vaults/pinskvsharedtoolinguks"
  tooling_network_name                              = "pins-vnet-shared-tooling-uks"
  tooling_network_region_short                      = "uks"
  tooling_network_rg                                = "pins-rg-shared-tooling-uks"
  tooling_subscription_id                           = "edb1ff78-90da-4901-a497-7e79f966f8e2"

  sb_topic_names = {
    common = {
      service_user = "service-user"
    }

    applications = {
      commands = {
        register_nsip_subscription          = "register-nsip-subscription"
        register_representation             = "register-representation"
        deadline_submission_topic           = "deadline-submission-topic"
        deadline_submission_result          = "deadline-submission-result"
        dco_portal_data_submissions         = "dco-portal-data-submissions" 
      }

      events = {
        nsip_project                                = "nsip-project"
        nsip_project_update                         = "nsip-project-update"
        nsip_documents                              = "nsip-document"
        folders                                     = "folder"
        nsip_subscription                           = "nsip-subscription"
        nsip_exam_timetable                         = "nsip-exam-timetable"
        nsip_representation                         = "nsip-representation"
        nsip_s51_advice                             = "nsip-s51-advice"
        redaction_system_redaction_process_complete = "redaction-process-complete"
      }
    }
  }

  service_bus_config = {
    # default service bus topic TTL
    default_topic_ttl = "P3D"
    # default TTL for back office subscriptions
    bo_subscription_ttl = "P1D"
    # default TTL for internal subscriptions, used for background process such as notify subscribers
    bo_internal_subscription_ttl = "P1D"
    # default TTL for front office subscriptions
    fo_subscription_ttl = "P1D"
  }
}
