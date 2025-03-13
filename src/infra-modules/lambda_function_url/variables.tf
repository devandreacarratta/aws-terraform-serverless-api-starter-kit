variable "lambda_function_name" {
  type     = string
  nullable = false
}

variable "cors_allow_credentials" {
  type    = bool
  default = false
}

variable "cors_allow_headers" {
  type = list(string)
}

variable "cors_allow_methods" {
  type = list(string)
}

variable "cors_allow_origins" {
  type = list(string)
}

variable "cors_expose_headers" {
  type = list(string)
}
variable "cors_max_age" {
  type    = number
  default = 0
}
