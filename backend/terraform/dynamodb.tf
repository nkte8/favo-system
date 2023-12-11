# dynamodb.tf 

resource "aws_dynamodb_table" "favo_dynamodb" {
    name           = "favodb"
    billing_mode   = "PROVISIONED"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "page_url"
    # range_key      = "GameTitle"

  attribute {
        name = "page_url"
        type = "S"
    }

  # global_secondary_index {
  #       name               = "GameTitleIndex"
  #       hash_key           = "GameTitle"
  #       range_key          = "TopScore"
  #       write_capacity     = 10
  #       read_capacity      = 10
  #       projection_type    = "INCLUDE"
  #       non_key_attributes = ["UserId"]
  #   }

    tags = {
        Name        = "favo_dynamodb"
    }
}