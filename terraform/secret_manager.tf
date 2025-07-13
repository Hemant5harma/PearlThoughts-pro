resource "aws_secretsmanager_secret" "medusa_env" {
  name = "medusa-env-secrets"
}

resource "aws_secretsmanager_secret_version" "medusa_env_version" {
  secret_id     = aws_secretsmanager_secret.medusa_env.id
  secret_string = jsonencode({
    DB_PASSWORD = var.db_password,
    ADMIN_CORS  = "http://localhost:7000",
    STORE_CORS  = "http://localhost:8000",
    AUTH_CORS   = "http://localhost:9000",
  })
}
