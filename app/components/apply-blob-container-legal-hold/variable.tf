variable "blob_store_account_container_pairs" {
  description = "A list of storage account name and container pairs"
  type        = list(list(string))
  default = [
    ["account1", "container1"],
    ["account1", "container2"],
    ["account2", "container3"]
  ]
}
