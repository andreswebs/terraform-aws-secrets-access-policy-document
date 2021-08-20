# terraform-aws-secrets-access-policy-document

[//]: # (BEGIN_TF_DOCS)
Generates an IAM policy document with permissons to access a list of secrets
from AWS Secrets Manager.

## Usage

Example:

```hcl
module "secrets_access" {
  source = "github.com/andreswebs/terraform-aws-secrets-access-policy-document"
  secret_names = [
    "password",
    "token",
    "etc"
  ]
}

## --> use module.secrets_access.json
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_secret_names"></a> [secret\_names](#input\_secret\_names) | List of friendly names of the allowed secrets | `list(string)` | n/a | yes |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_json"></a> [json](#output\_json) | The IAM Policy document JSON contents |
| <a name="output_secret_arns"></a> [secret\_arns](#output\_secret\_arns) | List of allowed secret ARNs |
| <a name="output_secret_names"></a> [secret\_names](#output\_secret\_names) | List of friendly names of the allowed secrets |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.48.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.48.0 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

[//]: # (END_TF_DOCS)


## Authors

**Andre Silva** [@andreswebs](https://github.com/andreswebs)


## License

This project is licensed under the [Unlicense](UNLICENSE.md).
