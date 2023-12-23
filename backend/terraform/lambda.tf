# lambda.tf

variable "lambda_favo_system_payload_name" {}
variable "lambda_favo_system_payload_src" {}
variable "lambda_favo_system_name" {}
variable "lambda_favo_system_handler" {}

variable "lambda_layer_payload_name" {}
variable "lambda_layer_payload_src" {}
variable "lambda_layer_name" {}

data "archive_file" "lambda_favo_system_payload" {
  type        = "zip"
  source_dir = var.lambda_favo_system_payload_src
  output_path = var.lambda_favo_system_payload_name
}

resource "aws_lambda_function" "lambda_favo_system_function" {
  filename      = var.lambda_favo_system_payload_name
  function_name = var.lambda_favo_system_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.lambda_favo_system_handler

  source_code_hash = data.archive_file.lambda_favo_system_payload.output_base64sha256

  runtime = "python3.11"
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

resource "aws_lambda_function_url" "lambda_favo_system_function_url" {
  function_name      = aws_lambda_function.lambda_favo_system_function.arn
  authorization_type = "NONE"

  cors {
    allow_credentials  = true
    allow_origins      = ["https://unnamedworks.com/","https://app.newt.so"]
    allow_methods      = ["POST","GET"]
    allow_headers      = ["date", "keep-alive"]
    expose_headers     = ["keep-alive", "date"]
    max_age            = 86400
  }
  depends_on = [
    aws_lambda_function.lambda_favo_system_function
  ]
}

output "lambda_favo_system_function_url" {
  value = aws_lambda_function_url.lambda_favo_system_function_url.function_url
}