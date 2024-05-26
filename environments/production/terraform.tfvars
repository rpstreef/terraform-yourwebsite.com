# General
environment = "prod"
region      = "us-east-1"
project     = "yourwebsite.com"

tags = {
  environment = "production"
  terraform   = true
  product     = "yourwebsite.com"
}

aws_profile    = "yourwebsite-prod"
hosted_zone_id = "Z01234145234564"

# www.yourwebsite.com
product_name = "yourwebsite"
bucket_name  = "yourwebsite.com"
bucket_cors = {
  rule1 = {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST"]
    allowed_origins = ["https://f.convertkit.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}
domain_names = ["yourwebsite.com", "www.yourwebsite.com"]

custom_error_responses = [{
  error_code = 404
  error_caching_min_ttl = 10
  response_code = 200
  response_page_path = "/404.html"
}]