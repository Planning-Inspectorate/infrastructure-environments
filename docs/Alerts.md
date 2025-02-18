# Alerts & Action Groups

Azure Alerts are setup with various triggers. The recipients of these alerts depends on the service they affect and severity of the issue.

To cater for this, the `common` stack creates several Action Groups per service, and a few common ones. The emails are not in code, since they can change; they must be managed in Azure Portal.

Each stack then gets the appropriate Action Groups mapped as variables to use for alerts - these are linked via terragrunt. Each stack has an alert group for:

* tech - accessed as `var.action_group_ids.tech`
* service manager - accessed as `var.action_group_ids.service_manager`
* IAP (common) - accessed as `var.action_group_ids.iap`
* ITS (common) - accessed as `var.action_group_ids.its`
* InfoSec (common) - accessed as `var.action_group_ids.info_sec`
