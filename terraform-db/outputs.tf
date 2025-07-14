output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "The private subnets in the VPC"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "The public subnets in the VPC"
}

output "db_endpoint" {
  value       = aws_db_instance.medusa_db.endpoint
  description = "The endpoint of the RDS database instance"
}

output "db_sg_id" {
  value       = aws_security_group.db_sg.id
  description = "The ID of the security group for the RDS database"
}

output "db_username" {
  value       = aws_db_instance.medusa_db.username
  description = "The username for the RDS database"
}

output "db_password" {
  value       = aws_db_instance.medusa_db.password
  sensitive   = true
  description = "The password for the RDS database (sensitive)"
}

output "db_name" {
  value       = aws_db_instance.medusa_db.db_name
  description = "The name of the RDS database"
}