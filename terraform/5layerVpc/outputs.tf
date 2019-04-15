output "vpc" {
  value = "${aws_vpc.l_nik_vpc.id}"
}

output "internet_gateway" {
  value = "${aws_internet_gateway.lnik_igw.id}"
}
output "eip" {
  value = "${aws_eip.eip.id}"
}
output "nat_gateway" {
  value = "${aws_nat_gateway.NATgw.id}"
}

output "subnet-publlic"{
	value ="${aws_subnet.pubSubnet1.id}"
}

output "subnet-priv1"{
	value ="${aws_subnet.privSubnet1.id}"
}

output "subnet-priv2"{
	value ="${aws_subnet.privSubnet2.id}"
}

output "subnet-priv3"{
	value ="${aws_subnet.privSubnet3.id}"
}

output "subnet-priv4"{
	value ="${aws_subnet.privSubnet4.id}"
}


output "routeTable-public"{
	value ="${aws_route_table.lnikRTpublic.id}"
}

output "routeTable-private"{
	value ="${aws_route_table.lnikRTpriv.id}"
}

output "network_acl"{
	value ="${aws_network_acl.lnik_nacl.id}"
}