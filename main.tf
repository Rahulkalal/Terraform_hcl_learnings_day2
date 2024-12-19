# Configure AWS provider
provider "aws" {
  region = "us-east-1"
}

# S3 Backend for state storage
terraform {
  backend "s3" {
    bucket         = "your-tf-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
    versioning     = true
  }
}

# S3 Bucket to store the Terraform state (if you're creating it with Terraform)
resource "aws_s3_bucket" "tf_state" {
  bucket = "your-tf-state-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}

# DynamoDB Table for state locking (if you're creating it with Terraform)
resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
