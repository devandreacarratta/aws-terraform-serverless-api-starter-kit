locals {
  cloudwatch_log_group_lambda_post_order_name = "/aws/lambda/${local.lambda_function_name_post}"
  cloudwatch_log_group_lambda_get_order_name  = "/aws/lambda/${local.lambda_function_name_get}"
}


module "cloudwatch_log_group_lambda_post_order" {
  source            = "../infra-modules/cloudwatch_log_group"
  name              = local.cloudwatch_log_group_lambda_post_order_name
  retention_in_days = var.cloudwatch_retention_in_days
  tags              = local.tags
}

module "cloudwatch_log_group_lambda_get_order" {
  source            = "../infra-modules/cloudwatch_log_group"
  name              = local.cloudwatch_log_group_lambda_get_order_name
  retention_in_days = var.cloudwatch_retention_in_days
  tags              = local.tags
}
