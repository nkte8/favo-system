# terraform.tfvars
# provider.tf
aws_region = "ap-northeast-1"
env = "prod"

# iam
iam_lambda = "iam_for_lambda"

# dynamodb
dynamodb_no_import_props = {}
dynamodb_props = {
        favodb = {
            name = "favodb"
            read_capacity = 5
            write_capacity = 5
            hash_key = "Identify"
			import_s3_bucket = "favo-system"
			import_s3_key_prefix = "AWSDynamoDB/01704219824289-11f92080/"
        },
		userdb = {
			name = "userdb"
			read_capacity = 5
			write_capacity = 5
			hash_key = "Identify"
			import_s3_bucket = "favo-system"
			import_s3_key_prefix = "AWSDynamoDB/01704219978253-5812c690"	
		},
    }

# lambda
lambda_favo_counter_payload_name = "../lambda_favo_counter_payload.zip"
lambda_favo_counter_payload_src = "../lambda/src/favo_counter/"
lambda_favo_counter_name = "favo_counter"
lambda_favo_counter_handler = "lambda_function.handler"

lambda_favo_counter_function_url_cors_origin = [
	"https://unnamedworks.com", "https://unnamedworks.pages.dev", "https://develop.unnamedworks.pages.dev",]

lambda_layer_payload_name = "../lambda_layer_payload.zip"
lambda_layer_payload_src = "../lambda/layers/"
lambda_layer_name = "favo_system_layer"