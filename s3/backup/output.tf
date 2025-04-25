# Output the S3 bucket name for reference
output "bucket_name" {
  value = var.s3_bucket_name
}

# Output the lifecycle rule ID for reference
output "lifecycle_rule_id" {
  value = aws_s3_bucket_lifecycle_configuration.backup_lifecycle.rule[0].id
}
