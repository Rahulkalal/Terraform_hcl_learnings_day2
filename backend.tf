terraform {
  backend "s3" {
    bucket         = "your-unique-terraform-state-bucket"
    key            = "path/to/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

