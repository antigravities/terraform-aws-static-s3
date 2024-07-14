variable "domain" {
  description = "The domain name for the Web site"
  type        = string
}

variable "ttl" {
  description = "The TTL for the CloudFront distribution"
  type        = number
  default     = 60 * 60 # 1 hour
}

variable "price_class" {
  description = "The price class for the CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}

variable "root" {
  description = "The root directory of the files to be served on the local machine"
  type        = string
}

output "bucket" {
    description = "The name of the S3 bucket"
    value       = aws_s3_bucket.bucket.bucket
}

output "distribution" {
    description = "The domain name of the CloudFront distribution"
    value       = aws_cloudfront_distribution.distribution.domain_name
}