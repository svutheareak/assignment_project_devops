resource "aws_db_instance" "this" {
  identifier = "${var.name}-db"
  allocated_storage = var.allocated_storage
  engine = var.engine
  instance_class = var.instance_class
  name = var.db_name
  username = var.username
  password = var.password
  multi_az = var.multi_az
  publicly_accessible = false
  skip_final_snapshot = true
}
