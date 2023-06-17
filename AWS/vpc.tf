#VPC Creation
resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = var.vpc_tagName
  }
}

#Public subnet
resource "aws_subnet" "pubsubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = var.PubSub_TagName
  }
}

#Internet Getway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = var.igw_TagName
  }
  }

#Route Table
resource "aws_route_table" "myroute" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Pubroute"
  }
}
resource "aws_main_route_table_association" "mainRT" {
  vpc_id         = aws_vpc.myvpc.id
  route_table_id = aws_route_table.myroute.id
}

resource "aws_route_table_association" "subnet" {
  subnet_id      = aws_subnet.pubsubnet.id
  route_table_id = aws_route_table.myroute.id
}

