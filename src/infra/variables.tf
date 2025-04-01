variable "aws_region" {
  type     = string
  nullable = false
}

variable "project_name" {
  type     = string
  nullable = false
  default  = "api-starter-kit"
}

variable "project_environment" {
  type     = string
  nullable = false
}

# Random ID
variable "random_id_byte_length" {
  type    = number
  default = 8
}

# cloudwatch

variable "cloudwatch_retention_in_days" {
  type    = number
  default = 1
}

# dynamodb

variable "dynamodb_table_billing_mode" {
  type     = string
  nullable = false
  default  = "PAY_PER_REQUEST"
}

variable "dynamodb_table_hash_key" {
  type     = string
  nullable = false
  default  = "Id"
}

variable "dynamodb_table_attribute_name" {
  type     = string
  nullable = false
  default  = "Id"
}

variable "dynamodb_table_attribute_type" {
  type     = string
  nullable = false
  default  = "S"
}

# Lambda

variable "lambda_order_get_timeout" {
  type    = number
  default = 30
}

variable "lambda_order_post_timeout" {
  type    = number
  default = 30
}

# Lambda Function URL - Post Order

variable "lambda_function_url_post_cors_allow_credentials" {
  type    = bool
  default = false
}

variable "lambda_function_url_post_cors_allow_headers" {
  type    = list(string)
  default = ["*"]
}

variable "lambda_function_url_post_cors_allow_methods" {
  type    = list(string)
  default = ["POST"]
}

variable "lambda_function_url_post_cors_allow_origins" {
  type    = list(string)
  default = ["*"]
}

variable "lambda_function_url_post_cors_expose_headers" {
  type    = list(string)
  default = ["*"]
}

variable "lambda_function_url_post_cors_max_age" {
  type    = number
  default = 0
}

# Lambda Function URL - Post Order

variable "lambda_function_url_get_cors_allow_credentials" {
  type    = bool
  default = false
}

variable "lambda_function_url_get_cors_allow_headers" {
  type    = list(string)
  default = ["*"]
}

variable "lambda_function_url_get_cors_allow_methods" {
  type    = list(string)
  default = ["GET"]
}

variable "lambda_function_url_get_cors_allow_origins" {
  type    = list(string)
  default = ["*"]
}

variable "lambda_function_url_get_cors_expose_headers" {
  type    = list(string)
  default = ["*"]
}

variable "lambda_function_url_get_cors_max_age" {
  type    = number
  default = 0
}
