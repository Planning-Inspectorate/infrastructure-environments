variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority alerts"
  type        = string
}

variable "app_service_private_dns_zone_id" {
  description = "The id of the private DNS zone for App services"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "azuread_auth_client_id" {
  description = "The Back Office web frontend app registration ID used for Azure AD authentication"
  type        = string
  default     = null
}

variable "azuread_appeals_case_officer_group_id" {
  description = "The Azure AD group ID for Appeals Back Office case officers"
  type        = string
  default     = null
}

variable "azuread_appeals_inspector_group_id" {
  description = "The Azure AD group ID for Appeals Back Office inspectors"
  type        = string
  default     = null
}

variable "azuread_appeals_validation_officer_group_id" {
  description = "The Azure AD group ID for Appeals Back Office validation officers"
  type        = string
  default     = null
}

variable "azuread_applications_caseteam_group_id" {
  description = "The Azure AD group ID for Applications Back Office case team"
  type        = string
  default     = null
}

variable "azuread_applications_inspector_group_id" {
  description = "The Azure AD group ID for Applications Back Office inspectors"
  type        = string
  default     = null
}

variable "azuread_applications_case_admin_officer_group_id" {
  description = "The Azure AD group ID for Applications Back Office case admin officers"
  type        = string
  default     = null
}

variable "document_check_function_storage_name" {
  description = "Function Storage name"
  type        = string
}

variable "document_check_function_storage_primary_access_key" {
  description = "Function Storage Primary Access Key"
  type        = string
}

variable "feature_document_scanning_enabled" {
  default     = false
  description = "Whether or not Document Scanning has been enabled. Document Scanning is currently disabled in a DR deployment (in the secondary region), documents will be scanned when the primary comes online."
  type        = bool
}

variable "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  type        = string
}

variable "back_office_integration_subnet_id" {
  description = "Integration subnet for back office anti-virus resources"
  type        = string
}

variable "back_office_clamav_subnet_id" {
  description = "Integration subnet for the clamav container"
  type        = string
}

variable "container_registry_name" {
  description = "The name of the container registry that hosts the image"
  type        = string
}

variable "container_registry_rg" {
  description = "The resource group of the container registry that hosts the image"
  type        = string
}

variable "database_connection_string" {
  description = "The connection string used to connect to the Applications Back Office MySQL database"
  sensitive   = true
  type        = string
}

variable "appeals_database_connection_string" {
  description = "The connection string used to connect to the Back Office Appeals MySQL database"
  sensitive   = true
  type        = string
}

variable "document_storage_api_host" {
  description = "The full URI to the storage account used for back office documents"
  type        = string
}

variable "endpoint_subnet_id" {
  description = "The id of the private endpoint subnet the app service is linked to for ingress traffic"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the key vault so the App Service can pull secret values"
  type        = string
}

variable "key_vault_uri" {
  description = "The URI of the Key Vault"
  type        = string
}

variable "location" {
  description = "The location the App Services are deployed to in slug format e.g. 'uk-south'"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Azure Monitor Log Analytics Workspace"
  type        = string
}

variable "monitoring_alerts_enabled" {
  default     = false
  description = "Indicates whether Azure Monitor alerts are enabled for App Service"
  type        = bool
}

variable "node_environment" {
  description = "The node environment to be used for applications in this environment e.g. development"
  type        = string
  default     = "development"
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}

variable "private_endpoint_enabled" {
  description = "A switch to determine if Private Endpoint should be enabled for backend App Services"
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain the App Services"
  type        = string
}

variable "resource_suffix" {
  description = "The suffix for resource naming"
  type        = string
}

variable "service_bus_namespace_id" {
  default     = null
  description = "The ID of the Back Office service bus namespace"
  type        = string
}

variable "service_bus_namespace_name" {
  description = "The name of the Back Office service bus namespace"
  type        = string
}

variable "service_name" {
  description = "The name of the service the Azure App Services are part of"
  type        = string
}

variable "tags" {
  description = "The tags applied to all resources"
  type        = map(string)
}

variable "feature_service_bus_enabled" {
  description = "Whether or not Service Bus events are enabled"
  type        = string
}

variable "service_plan_sku" {
  default     = "P2v2"
  description = "The SKU of the App Service Plan providing resources to hosted App Services"
  type        = string
}

variable "common_vnet_id" {
  description = "The common infrastructure virtual network id"
  type        = string
}

# Setting this to empty string for now whilst we figure out DR plans
variable "employee_topic_id" {
  description = "The ID of the employee topic"
  type        = string
  default     = ""
}

variable "feature_odw_subscription_enabled" {
  description = "Temporary flag to enable/disable ODW subscription integration. Always disabled for uk-south for now."
  type        = bool
  default     = false
}

variable "servicebus_topic_nsip_documents_id" {
  description = "Service Bus Topic nsip-document id"
  type        = string
}

variable "servicebus_topic_nsip_project_update_id" {
  description = "Service Bus Topic nsip-project-update id"
  type        = string
}

variable "servicebus_topic_register_nsip_subscription_id" {
  description = "Service Bus Topic register-nsip-subscription id"
  type        = string
}

variable "servicebus_topic_deadline_submission_subscription_id" {
  description = "Service Bus Topic deadline-submission-subscription id"
  type        = string
}

variable "deadline_submissions_topic_name" {
  description = "Deadline Submissions Topic Name"
  type        = string
}

variable "document_storage_back_office_document_service_uploads_container_resource_manager_id" {
  description = "Back Office document-service-uploads container resource_manager_id"
  type        = string
}

variable "document_storage_back_office_published_documents_container_resource_manager_id" {
  description = "Back Office published-documents container resource_manager_id"
  type        = string
}

variable "document_storage_back_office_document_service_uploads_container_name" {
  description = "Document Storage document service uploads container name"
  type        = string
}

variable "back_office_documents_system_topic_name" {
  description = "Back Office Document Storage System Topic Name"
  type        = string
  default     = ""
}

variable "back_office_hostname" {
  description = "Back Office Hostname"
  type        = string
}

variable "back_office_appeals_hostname" {
  description = "Back Office Hostname"
  type        = string
}

variable "notify_subscribers_function_gov_notify_template_id" {
  description = "Notify Subscribers Function - GovNotify Template ID"
  type        = string
}

variable "applications_front_office_web_url" {
  description = "Applications Front Office Web URL"
  type        = string
}
