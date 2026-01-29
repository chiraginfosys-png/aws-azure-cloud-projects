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

resource "aws_instance" "cms012" {
  ami           = "ami-048ab8ac7e8c6533d"
  instance_type = "t3.micro"
}


terraform {
  backend "s3" {
    bucket         = "tstatebucket0111"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
    use_lockfile   = true
    encrypt        = true
  }
}

