variable "secret_names" {
  type        = list(string)
  description = "List of friendly names of the allowed secrets"
}

variable "additional_actions" {
  type        = list(string)
  description = "List of additional policy actions for the allowed secrets"
}
