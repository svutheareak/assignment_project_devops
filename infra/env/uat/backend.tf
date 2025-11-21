terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "infra/uat/terraform.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}
