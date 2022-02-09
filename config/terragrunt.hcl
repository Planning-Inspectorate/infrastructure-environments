locals {
  environment                   = get_env("ENV")
  stack                         = basename(get_terragrunt_dir())
  subscription                  = get_env("SUBSCRIPTION")
  tfstate_storage_container_key = local.stack == "base" ? "base.tfstate" : "environments/${local.environment}/${local.stack}.tfstate"
  variables_file_paths          = run_command("find", "${get_parent_terragrunt_dir()}/variables", "${get_terragrunt_dir()}/variables", "-type", "f")
  variables_files               = [for path in local.variables_file_paths : read_terragrunt_config(path).locals]
}

terraform {
  source = get_terragrunt_dir()

  extra_arguments "retry_lock" {
    commands  = get_terraform_commands_that_need_locking()
    arguments = ["-lock-timeout=20m"]
  }
}

generate {
  path      = "backend.tf"
  if_exists = "overwrite"
  source    = file("${get_parent_terragrunt_dir()}/backend.tf")
}

generate {
  path      = "provider.tf"
  if_exists = "skip"
  source    = file("${get_parent_terragrunt_dir()}/provider.tf")
}

remote_state {
  backend = "azurerm"

  config = {
    resource_group_name  = "pins-terraform"
    storage_account_name = "pins-terraform"
    container_name       = "terraform-state"
    key                  = local.tfstate_storage_container_key
  }
}

inputs = merge(
  merge(local.variables_files...),
  {
    common_tags = {
      created_by  = "terraform"
      environment = local.environment
      workload    = read_terragrunt_config("${get_terragrunt_parent_dir()}/variables/global.hcl").locals.workload
      stack       = local.stack
    }
  }
)
