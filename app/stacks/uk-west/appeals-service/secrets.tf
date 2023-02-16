# resource "azurerm_key_vault_secret" "app_secret" {
#   #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
#   #checkov:skip=CKV_AZURE_114: No need to set content type via Terraform, as secrets to be updated in Portal
#   for_each = toset(module.app_services.secret_names)

#   key_vault_id = var.key_vault_id
#   name         = each.value
#   value        = "<enter_value>"

#   tags = local.tags

#   lifecycle {
#     ignore_changes = [
#       value,
#       version
#     ]
#   }
# }
