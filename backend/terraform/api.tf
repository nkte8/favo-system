# # API Gateway、有料だった...ため、lambdaの関数URLを用いることにする。
# # api.tf
# variable "apigateway_favo_system_name" {}
# variable "apigateway_favo_system_description" {}
# variable "apigateway_favo_system_resource_name" {}

# resource "aws_apigatewayv2_api" "apigateway_favo_system" {
#   name          = var.apigateway_favo_system_name
#   description = var.apigateway_favo_system_description
#   protocol_type = "HTTP"
# }

# # GET
# resource "aws_apigatewayv2_integration" "apigateway_favo_system_integration_get" {
#   api_id               = aws_apigatewayv2_api.apigateway_favo_system.id
#   connection_type      = "INTERNET"
#   integration_method   = "GET"
#   integration_uri      = aws_lambda_function.lambda_favo_system_function.invoke_arn
#   integration_type     = "AWS_PROXY"
# }

# resource "aws_apigatewayv2_route" "apigateway_favo_system_route_get" {
#   api_id    = aws_apigatewayv2_api.apigateway_favo_system.id
#   route_key = "GET /${var.apigateway_favo_system_resource_name}"
#   target    = "integrations/${aws_apigatewayv2_integration.apigateway_favo_system_integration_get.id}"
# }

# # POST
# resource "aws_apigatewayv2_integration" "apigateway_favo_system_integration_post" {
#   api_id               = aws_apigatewayv2_api.apigateway_favo_system.id
#   connection_type      = "INTERNET"
#   integration_method   = "POST"
#   integration_uri      = aws_lambda_function.lambda_favo_system_function.invoke_arn
#   integration_type     = "AWS_PROXY"
# }

# resource "aws_apigatewayv2_route" "apigateway_favo_system_route_post" {
#   api_id    = aws_apigatewayv2_api.apigateway_favo_system.id
#   route_key = "POST /${var.apigateway_favo_system_resource_name}"
#   target    = "integrations/${aws_apigatewayv2_integration.apigateway_favo_system_integration_post.id}"
# }
