# dynamodb
variable "env" {
    type = string
}
variable "dynamodb_no_import_props" {
    type = map
    default = {}
}
variable "dynamodb_props" {
    type = map
    default = {}
}
