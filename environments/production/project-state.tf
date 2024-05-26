# eezze projects state storage

locals {
  projects_state_bucket_name = "tfstate-yourwebsite.com"
}

provider "aws" {
  region  = "us-east-1"
  profile = "yourwebsite-prod"
}

terraform {
  backend "s3" {
    bucket  = "tfstate-yourwebsite.com"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "yourwebsite-prod"

    encrypt = true
    acl     = "private"
  }
}

resource "aws_s3_bucket" "_" {
  bucket = local.projects_state_bucket_name
  lifecycle {
    prevent_destroy = false
  }

  tags = var.tags
}

data "aws_s3_bucket" "project_bucket" {
  bucket = local.projects_state_bucket_name

  depends_on = [
    aws_s3_bucket._
  ]
}

resource "aws_s3_bucket_public_access_block" "_" {
  bucket = aws_s3_bucket._.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [
    aws_s3_bucket._
  ]
}
