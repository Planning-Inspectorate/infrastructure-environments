locals {
  app_settings = merge(
    var.app_settings,
    {
      # List of environment variables for ClamAV: https://hub.docker.com/r/tiredofit/clamav
      DOCKER_ENABLE_CI       = true
      LISTEN_PORT            = var.listen_port
      WEBSITE_VNET_ROUTE_ALL = var.outbound_vnet_connectivity ? 1 : 0
    }
  )
}
