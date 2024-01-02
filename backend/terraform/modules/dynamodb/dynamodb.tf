# dynamodb.tf 
resource "aws_dynamodb_table" "dynamodb" {
	for_each = var.dynamodb_props

	name           = each.value.name
	billing_mode   = "PROVISIONED"
	read_capacity  = each.value.read_capacity
	write_capacity = each.value.write_capacity
	hash_key       = each.value.hash_key

	attribute {
		name = each.value.hash_key
		type = "S"
	}
	point_in_time_recovery {
		enabled = true
	}
    deletion_protection_enabled = true

    import_table {
        input_compression_type = "GZIP"
        input_format = "DYNAMODB_JSON"
        s3_bucket_source {
            bucket = each.value.import_s3_bucket
            key_prefix = each.value.import_s3_key_prefix
        }
    }
}

resource "aws_dynamodb_table" "dynamodb_no_import" {
	for_each = var.dynamodb_no_import_props

	name           = each.value.name
	billing_mode   = "PROVISIONED"
	read_capacity  = each.value.read_capacity
	write_capacity = each.value.write_capacity
	hash_key       = each.value.hash_key

	attribute {
		name = each.value.hash_key
		type = "S"
	}
	point_in_time_recovery {
		enabled = true
	}
    deletion_protection_enabled = true
}
