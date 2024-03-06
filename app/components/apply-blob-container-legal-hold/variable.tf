variable "blob_store_account_container_pairs" {
  description = "A list of blob storage account and container name pairs"
  type        = list(object({ blob_account_name = string, blob_container_name = string }))
  default = [
    {
      blob_account_name   = "blob-account1",
      blob_container_name = "blob-container1"
    },
    {
      blob_account_name   = "blob-account1",
      blob_container_name = "blob-container2"
    },
    {
      blob_account_name   = "blob-account2",
      blob_container_name = "blob-container3"
    }
  ]
}

variable "legal_hold_tags" {
  description = "A list of tags associated with the Legal Hold"
  type        = list(string)
  default     = ["LegalHold"]
}
