module "front_door" {
  source = "../../../components/back-office-app-services/bo-appeals-front-door"

  tooling_subscription_id = var.tooling_subscription_id

}
