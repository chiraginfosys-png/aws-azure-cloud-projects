resource "aws_s3_bucket" "cms001" {
 bucket = "cshahbuck01"
 object_lock_enabled = true
 tags = {
  Name = "marubucket"
  Environment = "Dev"
  }
}

resource "aws_s3_bucket" "tstate_bucket001" {
  bucket = "tstatebucket01"
  tags = {
   Description = "terraform state file backup"
         }
}

resource "aws_s3_object" "cms001_object" {
 bucket = aws_s3_bucket.cms001.id
 content = "/Users/chiraginfossys/desktop/Terraform_Sample/invoice_7672023.pdf"
 key = "invoice_7672023.pdf"
}

