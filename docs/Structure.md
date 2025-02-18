Repository Structure
====================

The Repository structure is as follows:
```
.
+-- app
|   +-- components
|       +-- ...
|   +-- modules
|       +-- ...
|   +-- stacks
|       +-- global
|           +-- ...
|       +-- uk-south
|           +-- ...
|       +-- uk-west
|           +-- ...
+-- config
|   +-- variables
|       +-- stacks
|           +-- ...
|       +-- dev.hcl
|       +-- global.hcl
|       +-- prod.hcl
|       +-- test.hcl
|   +-- backend.tf
|   +-- provider.tf
|   +-- terragrunt.hcl
+-- pipelines
|   +-- infra-cd.yml
|   +-- infra-cd.yml
+-- .gitignore
+-- .pre-commit-config.yaml
+-- .tflint.hcl
```

- `app`: contains the Terraform modules. These are broken down into 3 types.

|-|-|
|----------------|------------------------------------------------------------------------------------------------------------------------------|
| **Modules**    | Small re-usable modules with a collection of resources that are used together often. These are referenced by stacks.         |
| **Components** | Larger collection of resources and sub-modules that will be deployed across multiple stacks. These are referenced by stacks. |
| **Stacks**     | The main stack of resources e.g. the Appeals service in the UK West region.                                                  |


- `config`: contains the configuration for the project with things like variables for each environment.

- The project uses Terragrunt to deploy and manage the Terraform modules. This works via the parent and child `terragrunt.hcl` files. The parent file is located within the `config` folder, and contains the re-usable configuration across all stacks such as remote backend etc. The child `terragrunt.hcl` file is located in each stack folder. For example, when deploying the UK West Appeals Service stack, the child `terragrunt.hcl` file is read from `app/stacks/uk-west/appeals-service/terragrunt.hcl` and the parent is read from `config/terragrunt.hcl`.

- The variables are divided up into `*.hcl` files in the `variables` folder. The `global.hcl` file contains global variables, and there are also variables for each environment e.g. `dev.hcl`. There are also variables specific to each stack in the `config/varirables/stacks/<stack_name>/<environment>.hcl` files. These files are loaded in the parent `terragrunt.hcl` file.

- `pipelines`: contains Azure pipelines specified as YAML templates.

- Various config files are located at the project root e.g. `.tflint.hcl`.


Entry point
-----------

Each stack in the `stacks` directory has an `app-service.tf` file. This can be seen as the entry point of that stack. Other resources instantiated alongside it are typically referenced by the `app-service.tf` file.


infrastructure-modules
----------------------

The [infrastructure-modules](https://github.com/Planning-Inspectorate/infrastructure-modules) repository contains some custom modules imported by this repository.

For example, the `app/components/back-office-app-services/app-service.tf` file instantiates `node-app-service`, which is a custom module that handles most of the setup for a Linux-based web application.


Regions
-------

The primary region for the applications is UK West, with a secondary region of UK South for failover. This is why the `stacks` folder is organised as it is. Global infrastructure such as Front Door is located in the `global` folder.
