# Infrastructure (Environments)

Terraform Infrastructure as Code (IaC) to provision the required infrastructure for the Planning Inspectorate application environments.

- [Table of Contents](#infrastructure-environments)
  - [Tooling](#-tooling)
  - [Installation / Setup](#-installation--setup)
    - [Install tfenv and Terraform](#-install-tfenv-and-terraform)
    - [Install tgenv and Terragrunt](#-install-tgenv-and-terragrunt)
    - [Install pre-commit hooks](#-install-pre-commit-hooks)
    - [Install and use Terraform-docs](#-install-and-use-terraform-docs)
    - [Install and use TFLint](#-install-and-use-tflint)
    - [Install and use Checkov](#-install-and-use-checkov)
  - [Repository Structure](#-repository-structure)
    - [Regions](#-regions)
  - [Deployments](#-deployments)
  - [Pipelines](#-pipelines)

<br />

## Tooling
----------

  - IaC defined using [Terraform](https://www.terraform.io/)
  - Tooling for managing multiple Terraform modules and environments with [Terragrunt](https://terragrunt.gruntwork.io/)
  - Automated documentation using [Terraform-docs](https://github.com/terraform-docs/terraform-docs)
  - Validation and linting with [TFLint](https://github.com/terraform-linters/tflint)
  - [Checkov](https://www.checkov.io/) for static analysis of the code for security issues and misconfigurations
  - [Pre-commit](https://pre-commit.com/) hooks run checks to identify issues before code submission
  - [Azure DevOps YAML pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/?view=azure-devops) to deploy the infrastructure
  - [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) required for deployments

<br />

## Installation / Setup
-----------------------

The main tools required to work with this repo are Terraform and Terragrunt. Instructrions to install these can be found via their respective websites (see [Tooling](#-tooling) section).

However, if you are running macOS or Linux it is recommended you use a version manager for ease in case working with multiple Terraform/Terragrunt versions. For this you can use [tfenv](https://github.com/tfutils/tfenv) and [tgenv](https://github.com/cunymatthieu/tgenv).

<br />

### Install tfenv and Terraform
-------------------------------

Install tfenv ([Homebrew](https://brew.sh/)):
```
brew install tfenv
```

Install tfenv manually by checking out the repo and adding `.tfenv/bin` to your `$PATH`:
```
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
```

Install Terraform using tfenv:
```
tfenv install 1.1.6
```

<br />

### Install tgenv and Terragrunt
--------------------------------

Install tgenv:
```
git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv
echo 'export PATH="$HOME/.tgenv/bin:$PATH"' >> ~/.bash_profile
```

Install Terragrunt using tgenv:
```
tgenv install latest
tgenv use latest
```

<br />

### Install pre-commit hooks
----------------------------

Install pre-commit (requires Python/Pip):
```
pip install pre-commit
```

Install pre-commit ([Homebrew](https://brew.sh/)):
```
brew install pre-commit
```

Once pre-commit is installed, configure it in the project by running from the root:
```
pre-commit install
```

Pre-commit is configured using the `.pre-commit-config.yaml` file in the root of the project. In order for it to run, the required tools need to be installed which is covered below, and in the [Tooling](#-tooling) section.

<br />

### Install and use Terraform-docs
----------------------------------

Install terraform-docs ([Homebrew](https://brew.sh/)):
```
brew install terraform-docs
```

Install terraform-docs ([Chocolatey](https://chocolatey.org/)):
```
choco install terraform-docs
```

Terraform-docs automates Terraform documentation and makes it available in Markdown syntax. These have been placed in `README.md` files within each Terraform module throughout the repository.

This documentation has been automated using pre-commit hooks (see above). The `README.md` file for each Terraform module contains tags:
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
```

When the pre-commit hook runs then Terraform-docs will generate the documentation and add to the space between the tags.

If you create a new Terraform module, simply add a `README.md` file and add the above tags. Terraform-docs will then run for this module each time you make a commit.

To run Terraform-docs for the whole repository, run:
```
pre-commit run -a terraform-docs
```

<br />

### Install and use TFLint
--------------------------

Install tflint (Bash script Linux):
```
curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
```

Install tflint ([Homebrew](https://brew.sh/)):
```
brew install tflint
```

Install tflint ([Choolatey](https://chocolatey.org/)):
```
choco install tflint
```

TFLint is configured via the `.tflint.hcl` file in the project root. It needs to be initialised before running.
```
tflint --init
```

<br />

### Install and use Checkov
---------------------------

Install Checkov (Python/Pip):
```
pip install checkov
```

Install Checkov ([Homebrew](https://brew.sh/)):
```
brew install checkov
```

Checkov runs a scan of the infrastructure as code, and can be pointed a Terraform module using the -d flag:
```
checkov -d /path/to/module
```

In some scenarios Checkov may report configuration issues that are intentional. In order to bypass these checks, you can add a comment to the Terraform resource it complains about like so:
```
resource "azurerm_storage_account" "my_storage_account" {
  #checkov:skip=CKV_AZURE_109: Skip reason

  ...
}
```

Where in this example, `CKV_AZURE_109` is the check to bypass.

<br />

## Repository Structure
-----------------------

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

The `app` folder contains the Terraform modules. These are broken down into 3 types:
- `modules` - Small re-usable modules with a collection of resources that are used together often
- `components` - Larger collection of resources and sub-modules that will be deployed across multiple stacks
- `stacks` - The main stack of resources e.g. the Appeals service in the UK West region.

The `config` folder contains the configuration for the project with things like variables for each environment etc.

The project uses Terragrunt to deploy and manage the Terraform modules. This works via the parent and child `terragrunt.hcl` files. The parent file is located within the `config` folder, and contains the re-usable configuration across all stacks such as remote backend etc. The child `terragrunt.hcl` file is located in each stack folder. For example, when deploying the UK West Appeals Service stack, the child `terragrunt.hcl` file is read from `app/stacks/uk-west/appeals-service/terragrunt.hcl` and the parent is read from `config/terragrunt.hcl`.

The variables are divided up into `*.hcl` files in the `variables` folder. The `global.hcl` file contains global variables, and there are also variables for each environment e.g. `dev.hcl`. There are also variables specific to each stack in the `config/varirables/stacks/<stack_name>/<environment>.hcl` files. These files are loaded in the parent `terragrunt.hcl` file.

Azure pipelines are contained within the `pipelines` folder. These are specified as YAML templates.

Various config files are located at the project root e.g. `.tflint.hcl`.

<br />

### Regions
-----------

The primary region for the applications is UK West, with a secondary region of UK South for failover. This is why the `stacks` folder is organised as it is. Global infrastructure such as Front Door is located in the `global` foldeer.

## Deployments
--------------

Terragrunt is used to deploy the infrastructure. Each stack can be deployed individually, or all together with Terragrunt managing the dependencies.

**Note: Stacks should always deployed individually in production**

To deploy a stack, follow these steps:
1. Login to the Azure CLI (available via Azure Cloud Shell by default). If not using Cloud Shell, see the documentation for installing the Azure CLI.

   ```
   az login
   az account set --subscription "<subscription_id_or_subscription_name>"
   ```
2.  Navigate to the stack you wish to deploy
    ```
    cd app/stacks/uk-west/appeals-service
    ```
3.  Perform Terragrunt actions (Plan/Apply)
    ```
    terragrunt init
    terragrunt apply
    ```
4. To change environment add the `ENV` environment variable e.g.
   ```
   ENV=test terragrunt apply
   ```

**Note: The Azure Provider version is locked via the .terraform.lock.hcl files in each Terraform module**

To upgrade the provider the `-upgrade` flag can be passed to the `terragrunt init` command e.g.
```
terragrunt init -upgrade
```

If the deployment fails because you are deploying on a different platform to what the lock files specify, they can be updated by running
```
terragrunt providers lock -platform=<platform>
```

e.g.

```
terragrunt providers lock -platform=linux_amd64
```

<br />

## Pipelines
------------

The Pipelines run in the Azure DevOps [infrastructure](https://dev.azure.com/planninginspectorate/infrastructure) project. They are defined in YAML in the `pipelines` file.

There is a CI pipeline which runs validation and various checks. This is linked to Pull Requests, so it must pass before it is possible to merge.

The CD pipeline deploys to the various environments. This is triggered automatically to the Dev environment when there is a merge to the `main` branch. For manual runs, you must choose the region and stack you wish to deploy.
