# lambda.tf

# data "archive_file" "lambda_favo_counter" {
#   type        = "zip"
#   source_dir = "lambda/favo-counter/"
#   output_path = "lambda_function_payload.zip"
# }

# resource "aws_lambda_function" "lambda_function_favo_counter" {
#   filename      = "lambda_function_payload.zip"
#   function_name = "lambda_function_name"
#   role          = aws_iam_role.iam_for_lambda.arn
#   handler       = "lambda_function.handler"

#   source_code_hash = data.archive_file.lambda_favo_counter.output_base64sha256

#   runtime = "python3.11"

#   environment {
#     variables = {
#       foo = "bar"
#     }
#   }
# }

# data "archive_file" "lambda_layer_archive" {
#   type        = "zip"
#   source_dir = "lambda/layers/"
#   output_path = "lambda_layer_payload.zip"
# }

# resource "aws_lambda_layer_version" "lambda_layer" {
#   filename   = "lambda_layer_payload.zip"
#   layer_name = "lambda_layer_name"

#   compatible_runtimes = ["python3.11"]
# }
