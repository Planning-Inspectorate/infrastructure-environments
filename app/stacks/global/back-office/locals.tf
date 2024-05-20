locals {
  service_name = "back-office-applications-docs"
  tags = merge(
    var.common_tags,
    {
      ServiceName = local.service_name
      Region      = "Global"
    }
  )

  published_documents = {
    # strip leading "https://" and trailing "/" to leave just the domain names
    domain       = replace(replace(var.back_office_published_documents_domain, "https://", ""), "/", "")
    blob_endpont = replace(replace(var.published_documents_blob_storage_endpoint, "https://", ""), "/", "")
  }
}
