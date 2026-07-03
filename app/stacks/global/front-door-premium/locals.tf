locals {
  services = ["appeals", "applications", "crowndev", "template", "scheduling", "mpesc", "ada"]
  tags = merge(
    var.common_tags,
    {
      Region      = "global"
      ServiceName = "common"
    }
  )
}
