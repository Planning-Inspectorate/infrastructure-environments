resource "azurerm_eventgrid_system_topic_event_subscription" "uploads_container_create_events" {
  name                = "source-blobs"
  system_topic        = var.back_office_documents_system_topic_name
  resource_group_name = var.resource_group_name

  included_event_types = ["Microsoft.Storage.BlobCreated"]

  subject_filter {
    subject_begins_with = "/blobServices/default/containers/${var.document_storage_back_office_document_service_uploads_container_name}"
  }

  azure_function_endpoint {
    # Because of how the azurerm provider works for function apps, we actually can't create the function itself
    function_id                       = "${module.anti_virus_functions.app_id}/functions/check-document"
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
  }
}
