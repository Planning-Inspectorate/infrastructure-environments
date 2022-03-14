locals {
  environment           = get_env("ENV", "dev")
  location              = get_env("LOCATION", "uk-south")
  stack                 = basename(get_terragrunt_dir())
  global_variables      = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/global.hcl").locals
  environment_variables = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/${local.environment}.hcl").locals
  stack_variables = merge(
    read_terragrunt_config("${get_terragrunt_dir()}/variables/${local.environment}.hcl", { locals = {} }).locals,
    read_terragrunt_config("${get_terragrunt_dir()}/variables/global.hcl", { locals = {} }).locals
  )
  tooling_subscription_id = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/global.hcl").locals.tooling_subscription_id
}

terraform {
  source = "${get_parent_terragrunt_dir()}/../app//stacks/${local.region}/${local.stack}"

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

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = file("${get_parent_terragrunt_dir()}/provider.tf")
}

remote_state {
  backend = "azurerm"

  config = {
    subscription_id      = local.tooling_subscription_id
    resource_group_name  = "pins-rg-shared-terraform-uks"
    storage_account_name = "pinsstsharedtfstateuks"
    container_name       = "terraformstate"
    key                  = "environments/${local.environment}/${local.region}/${local.stack}.tfstate"
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
    }
  }
)
