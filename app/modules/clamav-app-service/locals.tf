locals {
  app_settings = merge(
    var.app_settings,
    {
      # List of environment variables for ClamAV: https://hub.docker.com/r/tiredofit/clamav
    }
  )
}
