# Retired Module

## Purpose

- A no-op Terraform module for stacks that have been retired.
- Allows Terragrunt/Terraform `init` and `plan` to run cleanly with no resources.

## Usage (optional wiring)

1. Add a flag in stack variables, for example in `config/variables/stacks/<stack>/global.hcl`:

```hcl
locals {
  retired = true
}
```

2. In `config/terragrunt.hcl`, compute a `local.module_source` that points to `../app//components/retired-module` when the flag is true, otherwise to the normal stack path.

## Example conditional in parent config

```hcl
locals {
  module_source = (try(local.stack_variables.retired, false)) ?
    "${get_parent_terragrunt_dir()}/../app//components/retired-module" :
    "${get_parent_terragrunt_dir()}/../app//stacks/${local.location}/${local.stack}"
}

terraform {
  source = local.module_source
}
```

## Notes

- This module contains no resources and produces no changes.
- Keep pipeline options updated to avoid selecting deprecated stacks inadvertently.
