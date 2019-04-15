 variable "aws_region" {
  default = "us-west-2"
  }

  variable "aws_ami"{
  default ="ami-e689729e"
  }

  variable "subnet_id" {
  default = "subnet-3978f671"
  }
  variable "securitygrp_id"{
  default = ["sg-93a6dcee"]
  }