locals {
  child_terragrunt_dir_absolute_path_parts = split("/", get_terragrunt_dir())
  environment                              = get_env("ODW_SUBSCRIPTION_ID", "dev")
  odw_subscription_id                      = get_env("ODW_SUBSCRIPTION_ID")
  odw_data_lake_storage_account_name       = get_env("ODW_DATA_LAKE_STORAGE_ACCOUNT_NAME")
  odw_resource_group_name                  = get_env("ODW_RESOURCE_GROUP_NAME")
  odw_synapse_sql_pool_host                = get_env("ODW_SYNAPSE_SQL_POOL_HOST")
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
}

terraform {
  source = "${get_parent_terragrunt_dir()}/../app//stacks/${local.location}/${local.stack}"

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
  local.odw_subscription_id,
  local.odw_data_lake_storage_account_name,
  local.odw_resource_group_name,
  local.odw_synapse_sql_pool_host,
  {
    common_tags = {
      CostCentre  = "90117"
      CreatedBy   = "terraform"
      Environment = local.environment
    },
    is_dr_deployment = local.is_dr_deployment
  }
)
