locals {
  s3_bucket_private_name = "${local.base_environment_project_name}-bucket-name-${random_id.random_id_storage.hex}"
}

module "s3_bucket_private_random_name" {
  source      = "../infra-modules/s3_bucket_private"
  bucket_name = ""
  tags        = local.tags
}

module "s3_bucket_private" {
  source      = "../infra-modules/s3_bucket_private"
  bucket_name = local.s3_bucket_private_name
  tags        = local.tags
}
