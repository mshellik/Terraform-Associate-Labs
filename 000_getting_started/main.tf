terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
    }
  }
}


provider "aws" {
  region  = "ap-southeast-2"
  #profile = "default"
}

resource "aws_instance" "server_000" {
  ami           = "ami-0cd2fd776297f621a"
  instance_type = "t2.micro"

  tags = {
    Name = "server_000"
  }
}
