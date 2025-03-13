variable "name" {
  type     = string
  nullable = false
}

variable "retention_in_days" {
  type     = number
  nullable = false
  default  = 7
}

variable "tags" {
  type     = map(string)
  default  = {}
  nullable = true
}
