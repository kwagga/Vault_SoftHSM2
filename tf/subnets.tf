resource "aws_subnet" "vault-softhsm-subnet-1" {
  cidr_block        = cidrsubnet(aws_vpc.vault-softhsm-vpc.cidr_block, 3, 1)
  vpc_id            = aws_vpc.vault-softhsm-vpc.id
  availability_zone = "eu-central-1a"
  tags = {
    Name = "${random_pet.name.id}-subnet-1"
  }
}

resource "aws_subnet" "vault-softhsm-subnet-2" {
  cidr_block        = cidrsubnet(aws_vpc.vault-softhsm-vpc.cidr_block, 3, 2)
  vpc_id            = aws_vpc.vault-softhsm-vpc.id
  availability_zone = "eu-central-1b"
  tags = {
    Name = "${random_pet.name.id}-subnet-2"
  }
}

resource "aws_subnet" "vault-softhsm-subnet-3" {
  cidr_block        = cidrsubnet(aws_vpc.vault-softhsm-vpc.cidr_block, 3, 3)
  vpc_id            = aws_vpc.vault-softhsm-vpc.id
  availability_zone = "eu-central-1c"
  tags = {
    Name = "${random_pet.name.id}-subnet-3"
  }
}

resource "aws_route_table" "vault-softhsm-rtb" {
  vpc_id = aws_vpc.vault-softhsm-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vault-softhsm-gw.id
  }
  tags = {
    Name = "${random_pet.name.id}-rtb"
  }
}
resource "aws_route_table_association" "subnet-association-1" {
  subnet_id      = aws_subnet.vault-softhsm-subnet-1.id
  route_table_id = aws_route_table.vault-softhsm-rtb.id
}

resource "aws_route_table_association" "subnet-association-2" {
  subnet_id      = aws_subnet.vault-softhsm-subnet-2.id
  route_table_id = aws_route_table.vault-softhsm-rtb.id
}

resource "aws_route_table_association" "subnet-association-3" {
  subnet_id      = aws_subnet.vault-softhsm-subnet-3.id
  route_table_id = aws_route_table.vault-softhsm-rtb.id
}
