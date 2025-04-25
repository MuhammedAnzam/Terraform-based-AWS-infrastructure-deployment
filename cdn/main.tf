# Use existing S3 bucket
data "aws_s3_bucket" "existing_bucket" {
  bucket = var.bucketname
}

# Website configuration for static hosting
resource "aws_s3_bucket_website_configuration" "static" {
  bucket = data.aws_s3_bucket.existing_bucket.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

# Origin Access Identity for CloudFront
resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = var.cloudfront_comment
}

# CloudFront Distribution
resource "aws_cloudfront_distribution" "my_distribution" {
  enabled             = true
  is_ipv6_enabled     = false
  default_root_object = var.index_document

  origin {
    domain_name = "${var.bucketname}.s3.${var.region}.amazonaws.com"
    origin_id   = "S3Origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3Origin"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  dynamic "logging_config" {
    for_each = var.enable_logging ? [1] : []
    content {
      include_cookies = false
      bucket          = var.log_bucket
      prefix          = "logs/"
    }
  }
}
