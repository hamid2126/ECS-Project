output "vpc_id" {
    description = "id of the vpc"
    value = aws_vpc.ecs_vpc.id
}

output "igw_id" {
    description = "id of the igw"
    value = aws_internet_gateway.igw.id
}

output "eip_id" {
    description = "id of the eip"
    value = aws_eip.eip.id
}

output "nat_gateway_id" {
    description = "id of the NAT gateway"
    value = aws_nat_gateway.nat_gateway.id
}

output "public_subnet1_id" {
    description = "id of the 1st public subnet"
    value = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
    description = "id of the 2nd public subnet"
    value = aws_subnet.public_subnet2.id
}

output "private_subnet1_id" {
    description = "id of the 1st private subnet"
    value = aws_subnet.private_subnet1.id
}

output "private_subnet2_id" {
    description = "id of the 2nd private subnet"
    value = aws_subnet.private_subnet2.id
}

output "igw_route_table_id" {
    description = "id of the igw"
    value = aws_route_table.igw_route_table.id
}

output "nat_gateway_route_table_id" {
    description = "id of the NAT gateway"
    value = aws_route_table.nat_route_table.id
}

output "private_subnets" {
  description = "IDs of the private subnets"
  value = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id ]
}

