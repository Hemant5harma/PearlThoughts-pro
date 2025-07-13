output "vpc_id" {
  value = module.vpc.vpc_id
}
output "private_subnets" {
  value = module.vpc.private_subnets
}
output "public_subnets" {
  value = module.vpc.public_subnets
}
output "db_endpoint" {
  value = aws_db_instance.medusa_db.endpoint
}
output "db_sg_id" {
  value = aws_security_group.db_sg.id
}
output "db_username" {
  value = aws_db_instance.medusa_db.username
}
output "db_password" {
  value     = aws_db_instance.medusa_db.password
  sensitive = true
}

output "db_port" {
  value = aws_db_instance.medusa_db.port
}
output "db_name" {
  value = aws_db_instance.medusa_db.db_name
}