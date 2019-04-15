provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc" "l_nik_vpc" {
  cidr_block       = "${var.cidr_block_vpc}"
  instance_tenancy = "default"

  tags {
    Name = "l_nik_vpc"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}

resource "aws_internet_gateway" "lnik_igw" {
  vpc_id = "${aws_vpc.l_nik_vpc.id}"

  tags {
    Name = "lnik_igw"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}

resource "aws_eip" "eip" {
  vpc      = true
}

resource "aws_nat_gateway" "NATgw" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${aws_subnet.pubSubnet1.id}"

  tags {
    Name = "NATgw"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}

resource "aws_subnet" "pubSubnet1" {
  vpc_id     = "${aws_vpc.l_nik_vpc.id}"
  cidr_block = "${var.cidr_block_public}"

  tags {
    Name = "public_subnet_1"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}

resource "aws_subnet" "privSubnet1" {
  vpc_id     = "${aws_vpc.l_nik_vpc.id}"
  cidr_block = "${var.cidr_block_private1}"

  tags {
    Name = "priv_subnet_1"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}
resource "aws_subnet" "privSubnet2" {
  vpc_id     = "${aws_vpc.l_nik_vpc.id}"
  cidr_block = "${var.cidr_block_private2}"

  tags {
    Name = "public_subnet_2"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}
resource "aws_subnet" "privSubnet3" {
  vpc_id     = "${aws_vpc.l_nik_vpc.id}"
  cidr_block = "${var.cidr_block_private3}"

  tags {
    Name = "priv_subnet_3"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}
resource "aws_subnet" "privSubnet4" {
  vpc_id     = "${aws_vpc.l_nik_vpc.id}"
  cidr_block = "${var.cidr_block_private4}"

  tags {
    Name = "priv_subnet_4"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}

resource "aws_route_table" "lnikRTpublic" {
  vpc_id = "${aws_vpc.l_nik_vpc.id}"

  route {
    cidr_block = "${var.cidr_block_internet}"
    gateway_id = "${aws_internet_gateway.lnik_igw.id}"
  }

   tags {
    Name = "public_routeT"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}
resource "aws_route_table" "lnikRTpriv" {
  vpc_id = "${aws_vpc.l_nik_vpc.id}"

  route {
    cidr_block = "${var.cidr_block_internet}"
    nat_gateway_id = "${aws_nat_gateway.NATgw.id}"
  }

  tags {
    Name = "priv_routeT"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}

resource "aws_route_table_association" "pubRTA" {
  subnet_id      = "${aws_subnet.pubSubnet1.id}"
  route_table_id = "${aws_route_table.lnikRTpublic.id}"
}

resource "aws_route_table_association" "privRTA1" {
  subnet_id      = "${aws_subnet.privSubnet1.id}"
  route_table_id = "${aws_route_table.lnikRTpriv.id}"
}
resource "aws_route_table_association" "privRTA2" {
  subnet_id      = "${aws_subnet.privSubnet2.id}"
  route_table_id = "${aws_route_table.lnikRTpriv.id}"
}
resource "aws_route_table_association" "privRTA3" {
  subnet_id      = "${aws_subnet.privSubnet3.id}"
  route_table_id = "${aws_route_table.lnikRTpriv.id}"
}
resource "aws_route_table_association" "privRTA4" {
  subnet_id      = "${aws_subnet.privSubnet4.id}"
  route_table_id = "${aws_route_table.lnikRTpriv.id}"
}


resource "aws_network_acl" "lnik_nacl" {
  vpc_id = "${aws_vpc.l_nik_vpc.id}"
  subnet_ids =["${aws_subnet.pubSubnet1.id}","${aws_subnet.privSubnet1.id}","${aws_subnet.privSubnet2.id}","${aws_subnet.privSubnet3.id}","${aws_subnet.privSubnet4.id}"]
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.cidr_block_internet}"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.cidr_block_myip}"
    from_port  = 80
    to_port    = 80
  }

  tags {
  Name = "lnik_acl"
    Owner = "nikhil.linga"
    Project = "ReanIntern"
    Environment = "Testing"
  }
}