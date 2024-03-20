locals {
  service_name = "back-office-applications-docs"
  environment  = var.environment

  tags = merge(
    var.common_tags,
    {
      ServiceName = local.service_name
      Region      = "Global"
    }
  )
}
