resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "RDS subnet group"
  }
}

resource "aws_db_instance" "db" {
  allocated_storage      = var.allocated_storage
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.instance_class
  multi_az               = var.multi_az
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  publicly_accessible    = false
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = var.security_group_ids
}
