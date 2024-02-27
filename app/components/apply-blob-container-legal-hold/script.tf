resource "null_resource" "apply_blob_container_legal_hold" {
  count = length(var.blob_store_account_container_pairs)

  triggers = {
    account_name   = var.blob_store_account_container_pairs[count.index][0]
    container_name = var.blob_store_account_container_pairs[count.index][1]
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
			az storage container legal-hold set \
				--account-name "${self.triggers.account}" \
				--container-name "${self.triggers.container}" \
				--tags "LegalHold"
		EOT
  }
}
