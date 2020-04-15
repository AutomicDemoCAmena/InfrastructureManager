variable "aws_access_key" {}
variable "aws_secret_key" {}
//variable "aws_ami" {default = "ami-0080e4c5bc078760e"}
variable "aws_ami" {default = "ami-0003569dd0860582f"}
variable "aws_security_group_id" {default = "sg-d1375eb1"}
variable "instance_type" {default = "t2.micro"}
variable "key_name" {default = "automic_demo_key_pem"}

provider "aws" {
  region     = "us-east-2"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

resource "aws_instance" "web" {
  ami                    = "${var.aws_ami}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${var.aws_security_group_id}"]
  key_name               = "${var.key_name}"
  tags = {
      Name = "AutomicIMdemo01"
  }
  }
