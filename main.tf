data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_partition" "current" {}

locals {
  secret_arn_prefix = "arn:${data.aws_partition.current.partition}:secretsmanager:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:secret"
  secret_arns = [for s in var.secret_names : "${local.secret_arn_prefix}:${s}-??????"]
}

data "aws_iam_policy_document" "this" {
  statement {
    sid = "AccessSecret"
    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds"
    ]
    resources = local.secret_arns
  }
}
