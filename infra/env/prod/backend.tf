terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "infra/prod/terraform.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}
