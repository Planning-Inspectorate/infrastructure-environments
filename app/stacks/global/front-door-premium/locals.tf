locals {
  services = ["appeals", "applications", "crowndev", "template", "scheduling"]
  tags = merge(
    var.common_tags,
    {
      Region      = "global"
      ServiceName = "common"
    }
  )
}
