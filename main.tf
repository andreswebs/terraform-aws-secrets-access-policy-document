data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_partition" "current" {}

locals {
  partition  = data.aws_partition.current.partition
  region     = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  secret_arn_prefix = "arn:${local.partition}:secretsmanager:${local.region}:${local.account_id}:secret"


  secret_arns = compact(concat(
    [for s in var.secret_names : "${local.secret_arn_prefix}:${s}-??????"],
    [for s in var.secret_name_prefixes : "${local.secret_arn_prefix}:${s}*"],
  ))

  default_actions = [
    "secretsmanager:GetResourcePolicy",
    "secretsmanager:GetSecretValue",
    "secretsmanager:DescribeSecret",
    "secretsmanager:ListSecretVersionIds"
  ]

  secret_actions = compact(concat(local.default_actions, var.additional_actions))
}

data "aws_iam_policy_document" "this" {

  statement {
    sid       = "List"
    actions   = ["secretsmanager:ListSecrets"]
    resources = ["*"]
  }

  statement {
    sid       = "Access"
    actions   = local.secret_actions
    resources = local.secret_arns
  }
}
