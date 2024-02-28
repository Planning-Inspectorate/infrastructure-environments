/*
  The ability to apply a Legal Hold on a blob container is currently not supported
  by terraform, so the approach is to import this module that runs an Azure CLI
  script to apply it once the resource has been provisioned.
*/
resource "null_resource" "apply_blob_container_legal_hold" {
  count = length(var.blob_store_account_container_pairs)

  triggers = {
    blob_account_name   = var.blob_store_account_container_pairs[count.index].blob_account
    blob_container_name = var.blob_store_account_container_pairs[count.index].blob_container
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
			az storage container legal-hold set \
				--account-name "${self.triggers.blob_account_name}" \
				--container-name "${self.triggers.blob_container_name}" \
				--tags "${join(" ", var.legal_hold_tags)}"
		EOT
  }
}
