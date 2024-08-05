Deployments
===========

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
