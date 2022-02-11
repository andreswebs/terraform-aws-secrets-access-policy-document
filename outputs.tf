output "json" {
  value       = data.aws_iam_policy_document.this.json
  description = "The IAM Policy document JSON contents"
}

output "secret_arns" {
  value = local.secret_arns
  description = "List of allowed secret ARNs"
}

output "secret_names" {
  value = var.secret_names
  description = "List of friendly names of the allowed secrets"
}

output "additional_actions" {
  value = var.additional_actions
  description = "List of additional policy actions for the allowed secrets"
}
