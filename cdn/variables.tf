variable "region" {
  description = "AWS region"
  type        = string
}

variable "bucketname" {
  description = "Name of the existing S3 bucket"
  type        = string
}

variable "index_document" {
  description = "Index document for the S3 static website"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Error document for the S3 static website"
  type        = string
  default     = "error.html"
}

variable "cloudfront_comment" {
  description = "Comment for CloudFront Origin Access Identity"
  type        = string
  default     = "Access Identity for CloudFront to access S3"
}

variable "enable_logging" {
  description = "Enable CloudFront logging"
  type        = bool
  default     = false
}

variable "log_bucket" {
  description = "S3 bucket name for CloudFront logs (required if logging enabled)"
  type        = string
  default     = ""
}
