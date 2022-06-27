#terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#setup AWS Provider
provider "aws" {
  region  = "us-west-2"
  profile = "tf-cli-west2"
}

#Create an EC2 instance of type Linux 2
resource "aws_instance" "my_linux2_instance" {
  ami = "ami-098e42ae54c764c35"
  instance_type = "t2.micro"
  tags = {
    "Name" = "helloword"
  }
  availability_zone = "us-west-2b"
  key_name = "tf-key-pair-us-west-2"
}

#Create a VPC with 
resource "aws_vpc" "tf_vpc" {
  cidr_block       = "10.123.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "tf_vpc"
  }
}