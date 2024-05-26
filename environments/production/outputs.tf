output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket for the static site"
  value       = module.s3_static_site.s3_bucket_arn
}

output "acm_certificate_arn" {
  value = module.s3_static_site.certificate_arn
}

output "cloudfront_distribution_id" {
  value = module.s3_static_site.cloudfront_distribution_id
}

output "aws_access_key_id" {
  value = module.s3_static_site.aws_access_key_id
}

output "aws_secret_access_key" {
  value = nonsensitive(module.s3_static_site.aws_secret_access_key)
  # sensitive = true
}