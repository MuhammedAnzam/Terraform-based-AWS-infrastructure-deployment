resource "aws_s3_bucket_policy" "allow_cloudfront" {
  bucket = data.aws_s3_bucket.existing_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowCloudFrontAccess",
        Effect    = "Allow",
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.oai.iam_arn
        },
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${data.aws_s3_bucket.existing_bucket.bucket}/*"
      }
    ]
  })
}
