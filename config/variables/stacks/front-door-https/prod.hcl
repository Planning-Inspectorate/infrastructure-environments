locals {
  # which front ends should use an Azure managed cert
  use_managed_cert_map = {
    ApplicationsService                     = true
    appeal-planning-decision-service-gov-uk = false # not supported for this domain
    BackOffice                              = true
    BackOfficeNew                           = true
    BackOfficeAppeals                       = true
    CommentPlanningAppeal                   = true
  }
}
