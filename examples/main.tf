module "secrets_access" {
  source = "github.com/andreswebs/terraform-aws-secrets-access-policy-document"
  secret_names = [
    "password",
    "token",
    "etc"
  ]
}

## --> use module.secrets_access.json