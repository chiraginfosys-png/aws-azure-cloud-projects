terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # optional: if you later add remote state, put backend config here
}

provider "aws" {
  region = var.aws_region
}

