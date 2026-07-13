variable "api_management_users" {
  description = <<EOT
Map of api_management_users, attributes below
Required:
    - api_management_name
    - email
    - first_name
    - last_name
    - resource_group_name
    - user_id
Optional:
    - confirmation
    - note
    - password
    - password_key_vault_id (alternative to password - read from Key Vault instead)
    - password_key_vault_secret_name (alternative to password - read from Key Vault instead)
    - state
EOT

  type = map(object({
    api_management_name            = string
    email                          = string
    first_name                     = string
    last_name                      = string
    resource_group_name            = string
    user_id                        = string
    confirmation                   = optional(string)
    note                           = optional(string)
    password                       = optional(string)
    password_key_vault_id          = optional(string)
    password_key_vault_secret_name = optional(string)
    state                          = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.api_management_users : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_users : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_users : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_users : (
        length(v.first_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_users : (
        length(v.email) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_users : (
        length(v.last_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

