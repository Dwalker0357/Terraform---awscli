provider "aws" {
  region  = "us-east-1"
  version = "2.8"
  access_key = var.access_key
  secret_key = var.secret_key 

}

resource "aws_instance" "example-us" {
  ami           = var.ami-us
  instance_type = var.type
}

variable "ami-us" {
  description = "machine image us"
  default     = "ami-00dc79254d0461090"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "aws-uk"
   access_key = var.access_key
  secret_key = var.secret_ke
}

resource "aws_instance" "example-uk" {
  provider      = "aws.aws-uk"
  ami           = var.ami-uk
  instance_type = var.type
}

variable "ami-uk" {
  description = "machine image uk"
  default     = "ami-079d9017cb651564d"
}

variable "type" {
  default = "t2.micro"
}