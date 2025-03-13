resource "aws_lambda_function_url" "lambda_function_url" {
  function_name      = var.lambda_function_name
  authorization_type = "NONE"
  cors {
    allow_credentials = var.cors_allow_credentials // bool
    allow_headers     = var.cors_allow_headers     // []
    allow_methods     = var.cors_allow_methods     // []
    allow_origins     = var.cors_allow_origins     // []
    expose_headers    = var.cors_expose_headers    // []
    max_age           = var.cors_max_age           // int
  }
}
