# Service module (example) - exposes variables for container definitions and task settings
variable "image" { type = string }
variable "name" { type = string }
variable "port" { type = number }

# container definition would be rendered here by calling templatefile or jsonencode
