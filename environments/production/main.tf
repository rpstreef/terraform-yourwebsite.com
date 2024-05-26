module "s3_static_site" {
  source = "git::https://github.com/rpstreef/terraform-static-site"

  aws_profile         = var.aws_profile
  hosted_zone_id      = var.hosted_zone_id
  is_top_level_domain = true

  product_name = var.product_name
  bucket_name  = var.bucket_name
  bucket_cors  = var.bucket_cors
  domain_names = var.domain_names

  custom_error_responses = var.custom_error_responses

  tags = var.tags
}