variable "blob_store_account_container_pairs" {
  description = "A list of blob storage account name and container pairs"
  type        = list(object({ blob_account = string, blob_container = string }))
  default = [
    {
      blob_account   = "account1",
      blob_container = "container1"
    },
    {
      blob_account   = "account1",
      blob_container = "container2"
    },
    {
      blob_account   = "account2",
      blob_container = "container3"
    }
  ]
}

variable "legal_hold_tags" {
  description = "A list of tags associated with the Legal Hold"
  type        = list(string)
  default     = ["LegalHold"]
}
