# creation of vpc
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  #enable_dns_hostnames = true

  tags = {
    Name = "main-vpc-dev"
  }
}

#creation of subnet
resource "aws_subnet" "vpc-dev-subnet1" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true


  tags = {
    "Name" = "mysubnet"
  }
}

#creation of internet-gateway for vpc-dev

resource "aws_internet_gateway" "vpc-dev-internetgateway" {
  vpc_id = aws_vpc.vpc-dev.id


}

#creation of route table
resource "aws_route_table" "vpc-dev-routetable" {
  vpc_id = aws_vpc.vpc-dev.id
}

#creation of routes on routes in route-table

resource "aws_route" "vpc-dev-routes" {
  route_table_id         = aws_route_table.vpc-dev-routetable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-internetgateway.id

}

#Association of routetable with subnet

resource "aws_route_table_association" "vpc-dev-routetable-association" {
  route_table_id = aws_route_table.vpc-dev-routetable.id
  subnet_id      = aws_subnet.vpc-dev-subnet1.id
}

#creation of security groups

resource "aws_security_group" "vpc-dev-sg" {
  name        = "vpc-dev-default-sg"
  description = "this is sg group"
  vpc_id      = aws_vpc.vpc-dev.id

  ingress {
    description = "allow port 80 from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "allow port 22 from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    #description = "allow all IP'S and All ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }


}

