locals {
  environment                 = get_env("ENV", "dev")
  stack                       = basename(get_terragrunt_dir())
  global_variables            = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/global.hcl").locals
  environment_variables       = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/${local.environment}.hcl").locals
  stack_variables             = [for file in fileset("${get_terragrunt_dir()}", "variables/*.hcl") : read_terragrunt_config(file).locals]
  tooling_remote_state_config = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/global.hcl").locals.tooling_remote_state_config
}

terraform {
  source = "${get_parent_terragrunt_dir()}/../app//stacks/${local.stack}"

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

  config = merge(local.tooling_remote_state_config, { key = "environments/${local.environment}/${local.stack}.tfstate" })
}

inputs = merge(
  local.global_variables,
  local.environment_variables,
  merge(local.stack_variables...),
  {
    common_tags = {
      CostCentre  = "90117"
      CreatedBy   = "terraform"
      Environment = local.environment
      ServiceName = local.stack
    }
  }
)
