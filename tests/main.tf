module "secrets_access" {
  source = "../"
  secret_names = [
    "password",
    "token",
    "etc"
  ]
}
