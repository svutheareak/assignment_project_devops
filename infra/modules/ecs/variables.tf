variable "name" { type = string }
variable "cpu" { type = number default = 256 }
variable "memory" { type = number default = 512 }
variable "desired_count" { type = number default = 1 }
variable "subnets" { type = list(string) }
variable "security_groups" { type = list(string) }
variable "execution_role_arn" { type = string }
variable "container_definitions" { type = string }
variable "target_group_arn" { type = string }
variable "container_name" { type = string }
variable "container_port" { type = number }
