# Create VPC
resource "aws_vpc" "ecs_vpc" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "threat-composer-vpc"
  }
}

# Create 2 public subnets
resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.cidr_block_public1
  availability_zone = var.az_1

  tags = {
    Name = "1st public subnet"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.cidr_block_public2
  availability_zone = var.az_2

  tags = {
    Name = "2nd public subnet"
  }
}

# Create 2 private subnets
resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.cidr_block_private1
  availability_zone = var.az_1

  tags = {
    Name = "1st private subnet"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.cidr_block_private2
  availability_zone = var.az_2

  tags = {
    Name = "2nd private subnet"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ecs_vpc.id

  tags = {
    Name = "internet gateway"
  }
}

# Create elastic ip
resource "aws_eip" "eip" {
  domain   = "vpc"
  depends_on = [ aws_internet_gateway.igw ]
}

# Create NAT gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "NAT gateway"
  }

  # Rely on igw
  depends_on = [aws_internet_gateway.igw]
}

# Create route table for igw
resource "aws_route_table" "igw_route_table" {
  vpc_id = aws_vpc.ecs_vpc.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "Internet gateway route table"
  }
}

# Create route table for NAT gateway
resource "aws_route_table" "nat_route_table" {
  vpc_id = aws_vpc.ecs_vpc.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_nat_gateway.nat_gateway.id
  }


  tags = {
    Name = "NAT gateway route table"
  }
}

# Route public subnets to point to igw
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.igw_route_table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.igw_route_table.id
}

# Route private subnets to point to NAT gateway
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.nat_route_table.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.nat_route_table.id
}
