output "api_management_users_id" {
  description = "Map of id values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.id if v.id != null && length(v.id) > 0 }
}
output "api_management_users_api_management_name" {
  description = "Map of api_management_name values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.api_management_name if v.api_management_name != null && length(v.api_management_name) > 0 }
}
output "api_management_users_confirmation" {
  description = "Map of confirmation values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.confirmation if v.confirmation != null && length(v.confirmation) > 0 }
}
output "api_management_users_email" {
  description = "Map of email values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.email if v.email != null && length(v.email) > 0 }
}
output "api_management_users_first_name" {
  description = "Map of first_name values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.first_name if v.first_name != null && length(v.first_name) > 0 }
}
output "api_management_users_last_name" {
  description = "Map of last_name values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.last_name if v.last_name != null && length(v.last_name) > 0 }
}
output "api_management_users_note" {
  description = "Map of note values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.note if v.note != null && length(v.note) > 0 }
}
output "api_management_users_password" {
  description = "Map of password values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.password if v.password != null && length(v.password) > 0 }
  sensitive   = true
}
output "api_management_users_resource_group_name" {
  description = "Map of resource_group_name values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "api_management_users_state" {
  description = "Map of state values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.state if v.state != null && length(v.state) > 0 }
}
output "api_management_users_user_id" {
  description = "Map of user_id values across all api_management_users, keyed the same as var.api_management_users"
  value       = { for k, v in azurerm_api_management_user.api_management_users : k => v.user_id if v.user_id != null && length(v.user_id) > 0 }
}

