resource "aws_db_subnet_group" "medusa_db_subnet" {
  name        = "db-subnet-group"
  description = "Subnet group for Medusa RDS"
  subnet_ids  = module.vpc.public_subnets
  tags = {
    Name = "db-subnet-group"
  }
}

# for future update make rds private

resource "aws_db_instance" "medusa_db" {
  identifier         = "medusa-db"
  engine             = "postgres"
  engine_version     = "15"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  db_name            = var.db_name
  username           = var.db_user
  password           = var.db_password
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.medusa_db_subnet.name
  skip_final_snapshot   = true
}
