
  variable "aws_region" {
  default = "us-west-2"
  }
  variable "cidr_block_vpc"{
  default ="10.0.0.0/16"
  }

  variable "cidr_block_public"{
  default ="10.0.1.0/24"
  }
  
  variable "cidr_block_private1"{
  default ="10.0.2.0/24"
  }
  
  variable "cidr_block_private2"{
  default ="10.0.3.0/24"
  }
   variable "cidr_block_private3"{
  default ="10.0.4.0/24"
  }
   variable "cidr_block_private4"{
  default ="10.0.5.0/24"
  }
  
  variable "cidr_block_internet"{
  default ="0.0.0.0/0"
  }


  variable "cidr_block_myip"{
  default = "202.65.158.154/32"
  }