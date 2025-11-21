variable "region" { default="ap-southeast-1" }
variable "bucket_name" {}
variable "dynamodb_table_name" { default="terraform-locks" }
variable "tags" { default = {} }
