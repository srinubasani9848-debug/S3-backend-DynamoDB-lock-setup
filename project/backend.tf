terraform {
  backend "s3" {
    bucket       = "terraform-remote-state-srinivasbasani-12345"
    key          = "demo/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
