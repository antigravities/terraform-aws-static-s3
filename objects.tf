locals {
  content_types = {
    "html" = "text/html"
    "css"  = "text/css"
    "js"   = "application/javascript"
    "png"  = "image/png"
    "jpg"  = "image/jpeg"
    "jpeg" = "image/jpeg"
    "webp" = "image/webp"
    "gif"  = "image/gif"
    "svg"  = "image/svg+xml"
    "woff" = "application/font-woff"
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.bucket

  for_each = fileset(var.root, "**/*")

  key    = each.value
  source = "${var.root}/${each.value}"

  content_type        = try(local.content_types[split(".", each.value)[length(split(".", each.value))]], "application/octet-stream")
  content_disposition = "inline"
}