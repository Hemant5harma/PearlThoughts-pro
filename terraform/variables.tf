
variable "db_name" {
  type = string
  default = "medusa_db"
}

variable "db_user" { 
  type = string
  default = "medusa_user"
}

variable "db_password" {
  description = "The database password"
  type        = string
  sensitive   = true
  default = "my_db_password"
}
