variable "secret_names" {
  type        = list(string)
  description = "List of friendly names of the allowed secrets"
}

variable "secret_name_prefixes" {
  type        = list(string)
  description = "List of prefixes of allowed secrets"
  default     = []
}

variable "additional_actions" {
  type        = list(string)
  description = "List of additional policy actions for the allowed secrets. Default is empty"
  default     = []
}
