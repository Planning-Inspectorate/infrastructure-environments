locals {
  services = ["appeals", "applications", "crowndev", "template"]
  tags = merge(
    var.common_tags,
    {
      Region      = "global"
      ServiceName = "common"
    }
  )
}
