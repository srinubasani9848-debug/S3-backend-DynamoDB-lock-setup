resource "aws_s3_bucket" "example" {
  bucket = "demo-s3-srinivasbasani-unique-001" # must be globally unique
  acl    = "private"

  tags = {
    Owner = "srinivasbasani"
    Environment = "demo"
    ManagedBy = "Terraform"
  }
}
