resource "azurerm_role_definition" "storage_blob_read_write_custom" {
  name        = "Storage Blob Read Write (custom) - ${var.environment}"
  scope       = data.azurerm_subscription.current.id
  description = "Read and write Blobs, no delete"

  permissions {
    data_actions = [
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read",
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write"
    ]
  }

  assignable_scopes = [
    data.azurerm_subscription.current.id
  ]
}
