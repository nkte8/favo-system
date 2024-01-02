# iam
variable "iam_lambda" {
    type = string
}

# lambda.tf
variable "lambda_favo_counter_payload_name" {
    type = string
}
variable "lambda_favo_counter_payload_src" {
    type = string
}

variable "lambda_favo_counter_name" {
    type = string
}
variable "lambda_favo_counter_handler" {
    type = string
}
variable "lambda_favo_counter_function_url_cors_origin" {
    type = list(string)
}

variable "lambda_layer_payload_name" {
    type = string
}
variable "lambda_layer_payload_src" {
    type = string
}
variable "lambda_layer_name" {
    type = string
}
