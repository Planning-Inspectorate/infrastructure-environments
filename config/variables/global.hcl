locals {
  container_registry_name = "pinscrsharedtoolinguks"
  container_registry_rg   = "pins-rg-shared-tooling-uks"
  tooling_subscription_id = "edb1ff78-90da-4901-a497-7e79f966f8e2"

  tooling_remote_state_config = {
    subscription_id      = local.tooling_subscription_id
    resource_group_name  = "pins-rg-shared-terraform-uks"
    storage_account_name = "pinsstsharedtfstateuks"
    container_name       = "terraformstate"
    key                  = "tooling.tfstate"
  }
}
