variable "aws_access_key" {}
variable "aws_secret_key" {}
//variable "aws_ami" {default = "ami-0080e4c5bc078760e"}
variable "aws_ami" {default = "ami-0003569dd0860582f"}
variable "aws_security_group_id" {default = "sg-0d8f4a7454d8b6200"}
variable "instance_type" {default = "t2.micro"}
variable "key_name" {default = "CentOS.pem"}
variable "tag_name" {default = "AutomicIMdemo"}


provider "aws" {
  region     = "me-south-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

resource "aws_instance" "web" {
  ami                    = "${var.aws_ami}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${var.aws_security_group_id}"]
  key_name               = "${var.key_name}"
  tags = {
      Name = "${var.tag_name}"
  }
  }

output "public_dns" {
  value = "${aws_instance.web.*.public_dns}"
}
output "public_ips" {
  value = ["${aws_instance.web.*.public_ip}"]
}
output "private_dns" {
  value = ["${aws_instance.web.*.private_dns}"]
}
output "private_ips" {
  value = ["${aws_instance.web.*.private_ip}"]
}