provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.43.0"
    }
  }
}
resource "aws_s3_bucket" "hermex-bucket" {
  bucket = "hermex-bucket"
  # To allow destruction of a non-empty bucket
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform-state-file" {
  bucket = aws_s3_bucket.hermex-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
