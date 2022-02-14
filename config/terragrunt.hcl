locals {
  environment                   = get_env("ENV", "dev")
  stack                         = basename(get_terragrunt_dir())
  tfstate_storage_container_key = local.stack == "base" ? "base.tfstate" : "environments/${local.environment}/${local.stack}.tfstate"
  global_variables              = [for file in fileset("${get_parent_terragrunt_dir()}", "variables/*.hcl") : read_terragrunt_config("${get_parent_terragrunt_dir()}/${file}").locals]
  stack_variables               = [for file in fileset("${get_terragrunt_dir()}", "variables/*.hcl") : read_terragrunt_config(file).locals]
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

  config = {
    #     subscription_id      = "00000000-0000-0000-0000-000000000000"
    resource_group_name  = "pins-uk-terraform-rg"
    storage_account_name = "pinsodtterraform"
    container_name       = "kctfstate"
    key                  = local.tfstate_storage_container_key
  }
}

inputs = merge(
  merge(local.global_variables...),
  merge(local.stack_variables...),
  {
    common_tags = {
      created_by  = "terraform"
      environment = local.environment
      workload    = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/global.hcl").locals.workload
      stack       = local.stack
    }
  }
)
