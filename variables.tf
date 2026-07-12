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
  # --- Unconfirmed validation candidates, derived from azurerm_api_management_user's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: user_id
  #   source:    [from validate.ApiManagementUserName] strings.HasPrefix(value, "-") || strings.HasSuffix(value, "-")
  # path: user_id
  #   source:    [from validate.ApiManagementUserName] !matched
  # path: api_management_name
  #   source:    [from validate.ApiManagementServiceName] !matched
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: confirmation
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: state
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

