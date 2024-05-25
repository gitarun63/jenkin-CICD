provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "rmbucket123" {
  bucket = "statefilestore"
}


resource "aws_dynamodb_table" "DynamoStateFileLock" {
  name = "statefilelock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}


resource "aws_s3_bucket_versioning" "remote_bucket_versioning" {
  bucket = aws_s3_bucket.rmbucket123.id
  versioning_configuration {
    status = "Enabled"
  }
}