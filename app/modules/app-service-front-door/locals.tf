locals {
  tags = merge(
    var.common_tags,
    {
      ServiceName = var.service_name
      Region      = "Global"
    }
  )
}
