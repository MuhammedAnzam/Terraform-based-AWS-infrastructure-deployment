output "s3_bucket_name" {
  description = "The name of the existing S3 bucket"
  value       = data.aws_s3_bucket.existing_bucket.bucket
}

output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.my_distribution.id
}

output "cloudfront_domain_name" {
  description = "CloudFront domain name"
  value       = aws_cloudfront_distribution.my_distribution.domain_name
}
