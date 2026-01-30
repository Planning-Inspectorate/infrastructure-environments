locals {
  child_terragrunt_dir_absolute_path_parts = split("/", get_terragrunt_dir())
  environment                              = get_env("ENV", "dev")
  location                                 = element(local.child_terragrunt_dir_absolute_path_parts, length(local.child_terragrunt_dir_absolute_path_parts) - 2)
  stack                                    = basename(get_terragrunt_dir())
  global_variables                         = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/global.hcl").locals
  environment_variables                    = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/${local.environment}.hcl").locals
  stack_variables = merge(
    read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/stacks/${local.stack}/${local.environment}.hcl", { locals = {} }).locals,
    read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/stacks/${local.stack}/global.hcl", { locals = {} }).locals
  )
  tooling_subscription_id = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/global.hcl").locals.tooling_subscription_id

  is_dr_deployment = get_env("DR_DEPLOYMENT", false)
  module_source    = (try(local.stack_variables.retired, false)) ?
    "${get_parent_terragrunt_dir()}/../app//components/retired-module" :
    "${get_parent_terragrunt_dir()}/../app//stacks/${local.location}/${local.stack}"
}

terraform {
  source = local.module_source

  extra_arguments "retry_lock" {
    commands  = get_terraform_commands_that_need_locking()
    arguments = ["-lock-timeout=20m"]
  }
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = file("${get_parent_terragrunt_dir()}/backend.tf")
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite"
  contents  = file("${get_parent_terragrunt_dir()}/providers.tf")
}

remote_state {
  backend = "azurerm"

  config = {
    subscription_id      = local.tooling_subscription_id
    resource_group_name  = "pins-rg-shared-terraform-uks"
    storage_account_name = "pinsstsharedtfstateuks"
    container_name       = "terraformstate"
    key                  = "environments/${local.environment}/${local.location}/${local.stack}.tfstate"
  }
}

inputs = merge(
  local.global_variables,
  local.environment_variables,
  local.stack_variables,
  {
    common_tags = {
      CostCentre  = "90117"
      CreatedBy   = "terraform"
      Environment = local.environment
    },
    is_dr_deployment = local.is_dr_deployment
  }
)
