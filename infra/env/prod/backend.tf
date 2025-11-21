terraform {
  backend "s3" {
    bucket = "mycompany-terraform-state-2025"
    key    = "env/prod/terraform.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}