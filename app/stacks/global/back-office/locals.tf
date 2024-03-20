locals {
  service_name = "back-office-applications-docs"
  tags = merge(
    var.common_tags,
    {
      ServiceName = local.service_name
      Region      = "Global"
    }
  )
}
