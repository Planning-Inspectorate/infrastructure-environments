locals {
  # which front ends should use an Azure managed cert
  use_managed_cert_map = {
      ApplicationsService                     = false
      appeal-planning-decision-service-gov-uk = false
      BackOffice                              = true
      BackOfficeAppeals                       = true
      CommentPlanningAppeal                   = true
    }
}