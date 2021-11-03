terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.63.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "west2"
}


resource "aws_vpc" "vpc-eu-west1" {
  cidr_block = "10.202.0.0/16"
  provider   = aws
  tags = {
    Name = "ion-web-proj"
  }
}

resource "aws_vpc" "vpc-eu-west2" {
  cidr_block = "10.202.0.0/16"
  provider   = aws.west2

  tags = {
    Name = "ion-web-proj"
  }
}