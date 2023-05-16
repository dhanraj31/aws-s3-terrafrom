# --------------------------------------------------------------------------------------------------------------------
# Provider
# --------------------------------------------------------------------------------------------------------------------

provider "aws" {
  region = var.aws_region
  access_key = "AKIA2RMQWVZ7NCDA5QFO"
  secret_key = "U/uZWqigw+M6RPkfHSRWXRqhKKzjlVpLPaQrcvos"
}
resource "aws_s3_bucket" "example" {
  bucket = "var.bucket_name"
}

resource "aws_s3_bucket_acl" "acl" {
  bucket =   aws_s3_bucket.example.id
  acl    =   "public" 
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "app" {
  bucket                  = aws_s3_bucket.example.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}