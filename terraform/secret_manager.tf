resource "aws_secretsmanager_secret" "medusa_env" {
  name = "medusa-env-secrets"
}

resource "aws_secretsmanager_secret_version" "medusa_env_version" {
  secret_id     = aws_secretsmanager_secret.medusa_env.id
  secret_string = jsonencode({
    DB_PASSWORD = var.db_password,
    ADMIN_CORS  = "http://localhost:5173,http://localhost:9000,https://docs.medusajs.com",
    STORE_CORS  = "http://localhost:8000,https://docs.medusajs.com",
    AUTH_CORS   = "http://localhost:5173,http://localhost:9000,http://localhost:8000,https://docs.medusajs.com",
  })
}
