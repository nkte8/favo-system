# terraform.tfvars

# need to override
aws_access_key_id = "access_key at override.tfvars"
aws_secret_access_key = "access_secret at override.tfvars"
aws_region = "us-east-1"

# # api.tf
# apigateway_favo_system_name = "favo-system"
# apigateway_favo_system_description = "favo system"
# apigateway_favo_system_resource_name ="favo"

# dynamodb.tf
dynamodb_favodb_name = "favorite DB"
dynamodb_favodb_hash_key = "Identify"

# lambda.tf
lambda_favo_system_payload_name = "lambda_favo_system_payload.zip"
lambda_favo_system_payload_src = "lambda/favo-counter/"
lambda_favo_system_name = "favo-system"
lambda_favo_system_handler = "lambda_function.handler"

lambda_layer_payload_name = "lambda_layer_payload.zip"
lambda_layer_payload_src = "lambda/layers/"
lambda_layer_name = "favo-system-layer"