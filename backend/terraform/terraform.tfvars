# terraform.tfvars

# need to override
aws_access_key_id = "access_key at override.tfvars"
aws_secret_access_key = "access_secret at override.tfvars"
aws_region = "ap-northeast-1"

# # api.tf
# apigateway_favo_counter_name = "favo-system"
# apigateway_favo_counter_description = "favo system"
# apigateway_favo_counter_resource_name ="favo"

# dynamodb.tf
dynamodb_favodb_name = "favorite DB"
dynamodb_favodb_hash_key = "Identify"

dynamodb_userdb_name = "user DB"
dynamodb_userdb_hash_key = "Identify"

# lambda.tf
lambda_favo_counter_payload_name = "lambda_favo_counter_payload.zip"
lambda_favo_counter_payload_src = "lambda/src/favo_counter/"
lambda_favo_counter_name = "favo_counter"
lambda_favo_counter_handler = "lambda_function.handler"

lambda_favo_counter_function_url_cors_origin = ["*"]

# lambda_ufav_counter_payload_name = "lambda_ufav_counter_payload.zip"
# lambda_ufav_counter_payload_src = "lambda/src/ufav_counter/"
# lambda_ufav_counter_name = "ufav_counter"
# lambda_ufav_counter_handler = "lambda_function.handler"

lambda_layer_payload_name = "lambda_layer_payload.zip"
lambda_layer_payload_src = "lambda/layers/"
lambda_layer_name = "favo-system-layer"