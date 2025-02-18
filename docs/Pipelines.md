Pipelines
=========

The Pipelines run in the Azure DevOps [infrastructure](https://dev.azure.com/planninginspectorate/infrastructure) project. They are defined in YAML in the `pipelines` file.

There is a CI pipeline which runs validation and various checks. This is linked to Pull Requests, so it must pass before it is possible to merge.

The CD pipeline deploys to the various environments. This is triggered automatically to the Dev environment when there is a merge to the `main` branch. For manual runs, you must choose the region and stack you wish to deploy.
