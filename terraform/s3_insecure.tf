# Intentionally insecure S3 bucket for IaC scanner testing. Do not deploy.

resource "aws_s3_bucket" "public" {
  bucket = "iac-tests-public-bucket"
}

# BAD: bucket ACL grants public read
resource "aws_s3_bucket_acl" "public" {
  bucket = aws_s3_bucket.public.id
  acl    = "public-read"
}

# BAD: no server-side encryption configured
# BAD: no versioning
# BAD: no public access block
