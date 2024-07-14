resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.bucket

  for_each = fileset(var.root, "**/*")

  key    = each.value
  source = "${var.root}/${each.value}"
}