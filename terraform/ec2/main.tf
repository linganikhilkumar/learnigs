provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_instance" "nikhil_ec2" {
  ami           = "${var.aws_ami}"
  instance_type = "t2.micro"
  key_name  = "keypair-lin"
  subnet_id = "${var.subnet_id}" 
  vpc_security_group_ids = "${var.securitygrp_id}"
  tags {
    Name = "lnik_ec2_tf"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
    Exp_date = "2017-11-10"
  }
   associate_public_ip_address = "true"

  }