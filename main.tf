# main.tf
resource "aws_s3_bucket" "terraform_state" {
  bucket = "your-unique-terraform-state-bucket"
  region = "us-east-1"
  versioning {
    enabled = true
  }
  server_side_encryption {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-locks"
  hash_key       = "LockID"
  billing_mode   = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}

