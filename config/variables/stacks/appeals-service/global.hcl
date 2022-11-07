locals {
  appeals_feature_flags = [
    {
      name      = "as-5408-final-comments"
      enabled   = true
      targeting = {
        percentage = 100
        users = ["E69999999"]
      }
    }
  ]
}
