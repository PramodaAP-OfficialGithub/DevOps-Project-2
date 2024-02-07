terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  access_key = "AKIATQ4GYLWCNWZ2XETX" #put your IAM access_key
  secret_key = "BhfInSOQx6MVUpggohoxEFgT/iga0EZWaxkR4HGt" # put your IAM secret_key
}


resource "aws_instance" "example" {
  ami = "ami-03f4878755434977f"
  count = 2
  instance_type = "t2.micro"
  key_name = "UBUNTU"
  tags = {
    Name = "kub-slave-${count.index}"
  }
}
resource "aws_instance" "main" {
  ami = "ami-03f4878755434977f"
  count = 1
  instance_type = "t2.micro"
  key_name = "UBUNTU"
  tags = {
     Name = "kub1-master"
  }
}
