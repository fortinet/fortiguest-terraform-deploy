// Creating Internet Gateway
resource "aws_internet_gateway" "fortiguestigw" {
  vpc_id = aws_vpc.fortiguest-vpc.id
  tags = {
    Name = "fortiguest-igw"
  }
}

// Route Table
resource "aws_route_table" "fortiguestpublicrt" {
  vpc_id = aws_vpc.fortiguest-vpc.id

  tags = {
    Name = "fortiguest-public-rt"
  }
}

resource "aws_route" "externalroute" {
  route_table_id         = aws_route_table.fortiguestpublicrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.fortiguestigw.id
}

resource "aws_route_table_association" "public1associate" {
  subnet_id      = aws_subnet.publicsubnetaz1.id
  route_table_id = aws_route_table.fortiguestpublicrt.id
}

resource "aws_eip" "FortiguestPublicIP" {
  depends_on        = [aws_instance.fortiguestvm]
  domain            = "vpc"
  network_interface = aws_network_interface.eth0.id
}

// Security Group

resource "aws_security_group" "public_allow" {
  name        = "Public Allow"
  description = "Public Allow traffic"
  vpc_id      = aws_vpc.fortiguest-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1812
    to_port     = 1812
    protocol    = "17"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1813
    to_port     = 1813
    protocol    = "17"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public Allow"
  }
}