# dynamodb.tf 

resource "aws_dynamodb_table" "favo_dynamodb" {
    name           = "favodb"
    billing_mode   = "PROVISIONED"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "page_url"

    attribute {
          name = "page_url"
          type = "S"
    }

    tags = {
        Name        = "favo_dynamodb"
    }
}

resource "aws_dynamodb_table" "user_dynamodb" {
    name           = "userdb"
    billing_mode   = "PROVISIONED"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "user_name"

    attribute {
          name = "user_name"
          type = "S"
    }

    tags = {
        Name        = "user_dynamodb"
    }
}