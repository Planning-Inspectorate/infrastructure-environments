locals {
  service_name = "appeals-back-office"
  tags = merge(
    var.common_tags,
    {
      ServiceName = local.service_name
      Region      = "Global"
    }
  )
}
