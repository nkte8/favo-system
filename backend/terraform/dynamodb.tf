# dynamodb.tf 

variable "dynamodb_favodb_name" {}
variable "dynamodb_favodb_hash_key" {}

variable "dynamodb_userdb_name" {}
variable "dynamodb_userdb_hash_key" {}

resource "aws_dynamodb_table" "favo_dynamodb" {
  name           = "favodb"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = var.dynamodb_favodb_hash_key

  attribute {
    name = var.dynamodb_favodb_hash_key
    type = "S"
  }

  tags = {
    Name        = var.dynamodb_favodb_name
  }
}

resource "aws_dynamodb_table" "user_dynamodb" {
  name           = "userdb"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = var.dynamodb_userdb_hash_key

  attribute {
    name = var.dynamodb_userdb_hash_key
    type = "S"
  }

  tags = {
    Name        = var.dynamodb_userdb_name
  }
}