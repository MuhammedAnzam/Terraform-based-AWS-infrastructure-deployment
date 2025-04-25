provider "aws" {
  region = var.aws_region
}

# S3 Lifecycle Configuration (for existing backup bucket)
resource "aws_s3_bucket_lifecycle_configuration" "backup_lifecycle" {
  bucket = var.s3_bucket_name  # Use the existing backup bucket name

  rule {
    id     = "ArchiveToGlacier"
    status = "Enabled"  # This enables the rule

    prefix  = ""  # Apply to all objects in the bucket

    transition {
      days          = var.transition_days_glacier
      storage_class = "GLACIER"
    }

    transition {
      days          = var.transition_days_deep_archive
      storage_class = "DEEP_ARCHIVE"
    }

    expiration {
      days = var.expiration_days
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 7  # Clean up incomplete multipart uploads after 7 days
    }
  }
}
