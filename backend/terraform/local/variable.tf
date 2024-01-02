#
variable "env" {}
# dynamodb
variable "dynamodb_props" {}
variable "dynamodb_no_import_props" {}

# lambda
variable "iam_lambda" {}
variable "lambda_favo_counter_payload_name" {}
variable "lambda_favo_counter_payload_src" {}
variable "lambda_favo_counter_name" {}
variable "lambda_favo_counter_handler" {}
variable "lambda_favo_counter_function_url_cors_origin" {}
variable "lambda_layer_payload_name" {}
variable "lambda_layer_payload_src" {}
variable "lambda_layer_name" {}
