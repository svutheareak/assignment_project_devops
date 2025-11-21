variable "name" { type = string }
variable "allocated_storage" { type = number default = 20 }
variable "engine" { type = string default = "postgres" }
variable "instance_class" { type = string default = "db.t3.micro" }
variable "db_name" { type = string default = "appdb" }
variable "username" { type = string default = "appuser" }
variable "password" { type = string default = "change_me" }
variable "multi_az" { type = bool default = true }
