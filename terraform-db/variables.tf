
variable "db_name" {
  type = string
  default = "medusa_db"
}

variable "db_username" { 
  type = string
  default = "medusa_user"
}

variable "db_password" {
  description = "The database password"
  type        = string
  sensitive   = true
  default = "hemant1234"
}
