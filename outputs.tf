output "api_management_users" {
  description = "All api_management_user resources"
  value       = azurerm_api_management_user.api_management_users
  sensitive   = true
}
output "api_management_users_api_management_name" {
  description = "List of api_management_name values across all api_management_users"
  value       = [for k, v in azurerm_api_management_user.api_management_users : v.api_management_name]
}
output "api_management_users_confirmation" {
  description = "List of confirmation values across all api_management_users"
  value       = [for k, v in azurerm_api_management_user.api_management_users : v.confirmation]
}
output "api_management_users_email" {
  description = "List of email values across all api_management_users"
  value       = [for k, v in azurerm_api_management_user.api_management_users : v.email]
}
output "api_management_users_first_name" {
  description = "List of first_name values across all api_management_users"
  value       = [for k, v in azurerm_api_management_user.api_management_users : v.first_name]
}
output "api_management_users_last_name" {
  description = "List of last_name values across all api_management_users"
  value       = [for k, v in azurerm_api_management_user.api_management_users : v.last_name]
}
output "api_management_users_note" {
  description = "List of note values across all api_management_users"
  value       = [for k, v in azurerm_api_management_user.api_management_users : v.note]
}
output "api_management_users_password" {
  description = "List of password values across all api_management_users"
  value       = [for k, v in azurerm_api_management_user.api_management_users : v.password]
  sensitive   = true
}
output "api_management_users_resource_group_name" {
  description = "List of resource_group_name values across all api_management_users"
  value       = [for k, v in azurerm_api_management_user.api_management_users : v.resource_group_name]
}
output "api_management_users_state" {
  description = "List of state values across all api_management_users"
  value       = [for k, v in azurerm_api_management_user.api_management_users : v.state]
}
output "api_management_users_user_id" {
  description = "List of user_id values across all api_management_users"
  value       = [for k, v in azurerm_api_management_user.api_management_users : v.user_id]
}

