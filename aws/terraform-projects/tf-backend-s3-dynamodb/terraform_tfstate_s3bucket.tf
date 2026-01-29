resource "aws_s3_bucket" "tstate_bucket001" {
  bucket = "tstatebucket01"
  tags = {
   Description = "terraform state file backup"
         }
}

terraform {
 backend "s3" {
  bucket = "tstatebucket01"
  key = "terraform.tfstate"
  region = "ap-southeast-2"
  use_lockfile = true
  encrypt = true
             }
          }

