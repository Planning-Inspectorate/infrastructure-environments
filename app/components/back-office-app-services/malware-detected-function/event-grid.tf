resource "azurerm_eventgrid_event_subscription" "malware_scanning_subscription" {
  name  = "malware-scanning-subscription"
  scope = var.malware_scanning_topic_id

  azure_function_endpoint {
    function_id                       = "${module.malware_detected_functions.app_id}/functions/malware-detected"
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
  }
}
