# S3 bucket for Terraform remote state
resource "aws_s3_bucket" "tfstate" {
  bucket = "terraform-remote-state-srinivasbasani-12345" # must be globally unique
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    id      = "keep-versions"
    enabled = true
    noncurrent_version_expiration {
      days = 30
    }
  }

  tags = {
    Owner = "srinivasbasani"
    Purpose = "Terraform State Storage"
  }
}

# DynamoDB table for Terraform state locking
resource "aws_dynamodb_table" "tf_locks" {
  name         = "terraform-locks-srinivasbasani"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Owner = "srinivasbasani"
    Purpose = "Terraform State Locking"
  }
}

output "bucket" {
  value = aws_s3_bucket.tfstate.bucket
}

output "dynamodb_table" {
  value = aws_dynamodb_table.tf_locks.name
}
