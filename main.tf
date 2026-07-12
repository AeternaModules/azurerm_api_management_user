data "azurerm_key_vault_secret" "password" {
  for_each     = { for k, v in var.api_management_users : k => v if v.password_key_vault_id != null && v.password_key_vault_secret_name != null }
  name         = each.value.password_key_vault_secret_name
  key_vault_id = each.value.password_key_vault_id
}
resource "azurerm_api_management_user" "api_management_users" {
  for_each = var.api_management_users

  api_management_name = each.value.api_management_name
  email               = each.value.email
  first_name          = each.value.first_name
  last_name           = each.value.last_name
  resource_group_name = each.value.resource_group_name
  user_id             = each.value.user_id
  confirmation        = each.value.confirmation
  note                = each.value.note
  password            = each.value.password != null ? each.value.password : try(data.azurerm_key_vault_secret.password[each.key].value, null)
  state               = each.value.state
}

