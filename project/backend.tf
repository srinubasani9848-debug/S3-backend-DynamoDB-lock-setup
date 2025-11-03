terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "terraform-remote-state-srinivasbasani-12345"
    key            = "demo/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks-srinivasbasani"
    encrypt        = true
  }
}
