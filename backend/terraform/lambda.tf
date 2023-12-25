# lambda.tf

variable "lambda_favo_counter_payload_name" {}
variable "lambda_favo_counter_payload_src" {}
variable "lambda_favo_counter_name" {}
variable "lambda_favo_counter_handler" {}

# variable "lambda_ufav_counter_payload_name" {}
# variable "lambda_ufav_counter_payload_src" {}
# variable "lambda_ufav_counter_name" {}
# variable "lambda_ufav_counter_handler" {}

variable "lambda_layer_payload_name" {}
variable "lambda_layer_payload_src" {}
variable "lambda_layer_name" {}

data "archive_file" "lambda_favo_counter_payload" {
  type        = "zip"
  source_dir = var.lambda_favo_counter_payload_src
  output_path = var.lambda_favo_counter_payload_name
}

resource "aws_lambda_function" "lambda_favo_counter_function" {
  filename      = var.lambda_favo_counter_payload_name
  function_name = var.lambda_favo_counter_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.lambda_favo_counter_handler

  source_code_hash = data.archive_file.lambda_favo_counter_payload.output_base64sha256

  runtime = "python3.11"

  layers = [
    aws_lambda_layer_version.lambda_layer.arn
    ]
}

data "archive_file" "lambda_layer_archive" {
  type        = "zip"
  source_dir = var.lambda_layer_payload_src
  output_path = var.lambda_layer_payload_name
}

resource "aws_lambda_layer_version" "lambda_layer" {
  filename   = var.lambda_layer_payload_name
  layer_name = var.lambda_layer_name

  compatible_runtimes = ["python3.11"]
}

resource "aws_lambda_function_url" "lambda_favo_counter_function_url" {
  function_name      = aws_lambda_function.lambda_favo_counter_function.arn
  authorization_type = "NONE"

  cors {
    allow_credentials  = true
    allow_origins      = ["https://unnamedworks.com"]
    allow_methods      = ["POST"]
    allow_headers      = ["content-type"]
    expose_headers     = []
    max_age            = 86400
  }
  depends_on = [
    aws_lambda_function.lambda_favo_counter_function
  ]
}

output "lambda_favo_counter_function_url" {
  value = aws_lambda_function_url.lambda_favo_counter_function_url.function_url
}

# resource "aws_cloudwatch_log_group" "cloudwatch_log_group_favo_counter" {
#   name = "/aws/lambda/${var.lambda_favo_counter_name}"
#   retention_in_days = 7
# }