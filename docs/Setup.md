Installation / Setup
====================

The main tools required to work with this repo are Terraform and Terragrunt. Instructrions to install these can be found via their respective websites (see [Tooling](#-tooling) section).

However, if you are running macOS or Linux it is recommended you use a version manager for ease in case working with multiple Terraform/Terragrunt versions. For this you can use [tfenv](https://github.com/tfutils/tfenv) and [tgenv](https://github.com/cunymatthieu/tgenv).


Install tfenv and Terraform
---------------------------

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
tfenv install 1.7.3
```


Install tgenv and Terragrunt
----------------------------

Install tgenv ([Homebrew](https://brew.sh/)):
```
brew install tgenv
```

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


Install pre-commit hooks
------------------------

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


Install and use Terraform-docs
------------------------------

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
pre-commit run -a terraform_docs
```


Install and use TFLint
----------------------

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

Install and use Checkov
-----------------------

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
