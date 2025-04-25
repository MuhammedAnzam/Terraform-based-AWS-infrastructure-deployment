# AWS region to deploy the resources
variable "aws_region" {
  description = "The AWS region to deploy the resources."
  default     = "us-east-1"
}

# S3 bucket name (must be unique)
variable "s3_bucket_name" {
  description = "The name of the existing S3 bucket for backup storage."
}

# Days after which to transition objects to Glacier
variable "transition_days_glacier" {
  description = "Days after which objects should be transitioned to Glacier."
  default     = 30
}

# Days after which to transition objects to Glacier Deep Archive
variable "transition_days_deep_archive" {
  description = "Days after which objects should be transitioned to Glacier Deep Archive."
  default     = 180
}

# Days after which objects should be expired (deleted)
variable "expiration_days" {
  description = "Days after which objects should be expired (deleted)."
  default     = 365
}
