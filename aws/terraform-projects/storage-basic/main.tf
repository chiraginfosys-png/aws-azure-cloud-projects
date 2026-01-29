resource "aws_s3_bucket" "demo" {
  bucket = "chiragshahcicd0011"
  tags = {
    Description = "CICD Trial"
  }
}

resource "aws_s3_bucket" "cms001" {
  bucket              = "cshahbuck0121"
  object_lock_enabled = true
  tags = {
    Name        = "marubucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "tstate_bucket001" {
  bucket = "tstatebucket0111"
  tags = {
    Description = "terraform state file backup"
  }
}

resource "aws_s3_object" "cms001_object" {
  bucket  = aws_s3_bucket.cms001.id
  content = "/Users/chiraginfossys/desktop/Terraform_Sample/invoice_7672023.pdf"
  key     = "invoice_7672023.pdf"
}
