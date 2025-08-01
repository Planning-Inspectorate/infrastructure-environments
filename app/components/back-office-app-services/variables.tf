variable "action_group_ids" {
  description = "The IDs of the Azure Monitor action groups for different alert types"
  type = object({
    bo_applications_tech            = string,
    bo_applications_service_manager = string,
    iap                             = string,
    its                             = string,
    info_sec                        = string
  })
}

variable "api_key_vault_authorization_enabled" {
  description = "Whether or not Key Vault is used to access secrets from the app"
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

variable "app_insights_instrument_key" {
  description = "App Insights instrument key, for the function apps"
  type        = string
  default     = null
}

variable "azuread_auth_client_id" {
  description = "The Back Office web frontend app registration ID used for Azure AD authentication"
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
  description = "Function Storage name. NOTE: This is storage for all functions."
  type        = string
}

variable "document_check_function_storage_primary_access_key" {
  description = "Function Storage Primary Access Key. NOTE: This is storage for all functions."
  type        = string
}

variable "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  type        = string
}

variable "back_office_integration_subnet_id" {
  description = "Integration subnet for back office anti-virus resources"
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

variable "database_name" {
  description = "The name of the Applications Back Office database"
  type        = string
}

variable "document_storage_api_host" {
  description = "The full URI to the storage account used for back office documents"
  type        = string
}

variable "document_storage_account_endpoint" {
  description = "The primary blob endpoint for the storage account used for back office documents"
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

variable "servicebus_topic_deadline_submission_topic_id" {
  description = "Service Bus Topic deadline-submission-topic id"
  type        = string
}

variable "servicebus_topic_deadline_submission_topic_name" {
  description = "Service Bus Topic deadline-submission-topic name"
  type        = string
}

variable "servicebus_topic_deadline_submission_result_id" {
  description = "Service Bus Topic deadline-submission-result id"
  type        = string
}

variable "servicebus_topic_register_representation_id" {
  description = "Service Bus Topic register-representation id"
  type        = string
}

variable "deadline_submissions_result_topic_name" {
  description = "Deadline Submissions Result Topic Name"
  type        = string
}

variable "malware_scanning_topic_id" {
  description = "Event grid topic name for publishing malware scan results"
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

variable "back_office_hostname" {
  description = "Back Office Hostname"
  type        = string
}

variable "notify_subscribers_function_gov_notify_template_id" {
  description = "Notify Subscribers Function - GovNotify Template ID"
  type        = string
}

variable "notify_subscribers_function_gov_notify_template_welsh_id" {
  description = "Notify Subscribers Function - GovNotify Welsh Template ID"
  type        = string
}

variable "applications_front_office_web_url" {
  description = "Applications Front Office Web URL"
  type        = string
}

variable "document_storage_submissions_container_resource_manager_id" {
  description = "Submissions container resource_manager_id"
  type        = string
}

variable "back_office_applications_log_level_file" {
  description = "Log level for the server.log file - trace, debug, info, warn, error, fatal, silent"
  type        = string
}

variable "back_office_applications_log_level_stdout" {
  description = "Log level for stdout - trace, debug, info, warn, error, fatal, silent"
  type        = string
}

variable "back_office_applications_redis_connection_string_secret_name" {
  description = "The connection string (secret name) used to connect to the Back Office Applications Redis Cache"
  type        = string
}

variable "sensitive_application_case_references" {
  description = "List of case references for applications considered as sensitive"
  type        = string
  default     = ""
}

variable "odw_synapse_integration_enabled" {
  description = "Whether or not Synapse Migration Integration is enabled"
  type        = bool
  default     = false
}

variable "odw_synapse_ssql_endpoint" {
  description = "Serverless SQL Endpoint for ODW Synapse"
  type        = string
  default     = ""
}

variable "odw_data_lake_storage_account_id" {
  description = "Storage Account ID for ODW Data Lake"
  type        = string
  default     = ""
}

variable "service_bus_config" {
  description = "service bus configuration"
  type = object({
    default_topic_ttl            = string
    bo_internal_subscription_ttl = string
    bo_subscription_ttl          = string
    fo_subscription_ttl          = string
  })
}

variable "text_analytics_config" {
  description = "Config for the text analytics (language) service"
  type = object({
    id       = string
    endpoint = string
  })
  default = null
}
