# NGINX will be deployed as a Fargate service using the ecs module (example pattern)
# This module provides only an example task definition override or container image variable
variable "image" { type = string default = "nginx:latest" }
