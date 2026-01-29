resource "aws_instance" "cms003" {
  ami           = "ami-048ab8ac7e8c6533d"
  instance_type = "t3.micro"
}

resource "aws_instance" "cms004" {
  ami           = "ami-048ab8ac7e8c6533d"
  instance_type = "t3.micro"
}

resource "aws_instance" "cms005" {
  ami           = "ami-048ab8ac7e8c6533d"
  instance_type = "t3.micro"
}

resource "aws_instance" "cms006" {
  ami           = "ami-048ab8ac7e8c6533d"
  instance_type = "t3.micro"
}

resource "aws_instance" "cms006" {
  ami           = "ami-048ab8ac7e8c6533d"
  instance_type = "t3.micro"
}


terraform {
  backend "s3" {
    bucket         = "my-tfstate-bucket"
    key            = "envs/prod/ec2/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "my-tfstate-lock"
    encrypt        = true
  }
}

