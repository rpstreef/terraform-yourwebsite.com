# -----------------------------------------------------------------------------
# Variables: General
# -----------------------------------------------------------------------------

variable "environment" {
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'test'"
  type        = string
}

variable "region" {
  description = "AWS region"
}

variable "project" {
  description = "Project name, used for naming purposes of resource created."
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "aws_profile" {
}
variable "hosted_zone_id" {
}

# yourwebsite.com and www.yourwebsite.com
variable "product_name" {
  description = "Name of the product that is deployed"
}

variable "bucket_name" {
  description = "The name of the S3 bucket for the static site"
}

variable "bucket_cors" {
  type = map(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  default = null
}

variable "domain_names" {
  description = "List of domain names for the applications"
  type        = list(string)
}

variable custom_error_responses {
  description = "A list of maps for custom error responses, e.g. 404 redirects to /404.html with response 200"
  type = list(object({
      error_code = number
      error_caching_min_ttl = number
      response_code = number
      response_page_path = string
  }))
  default = []
}