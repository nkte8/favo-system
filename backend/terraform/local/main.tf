module "dynamodb" {
    source = "../modules/dynamodb"
    env = var.env

    dynamodb_props = var.dynamodb_props
    dynamodb_no_import_props = var.dynamodb_no_import_props
}
module "lambda" {
    source = "../modules/lambda_function"

    iam_lambda = var.iam_lambda

    lambda_favo_counter_payload_name = var.lambda_favo_counter_payload_name
    lambda_favo_counter_payload_src = var.lambda_favo_counter_payload_src

    lambda_favo_counter_name = var.lambda_favo_counter_name
    lambda_favo_counter_handler = var.lambda_favo_counter_handler
    lambda_favo_counter_function_url_cors_origin = var.lambda_favo_counter_function_url_cors_origin

    lambda_layer_payload_name = var.lambda_layer_payload_name
    lambda_layer_payload_src = var.lambda_layer_payload_src
    lambda_layer_name = var.lambda_layer_name
}
