data aws_availability_zones "azs"{
  state = "available"

}


resource "aws_subnet" "private_subnet" {
  count                = var.number_of_private_subnets
  cidr_block           = cidrsubnet(aws_vpc.main_vpc.cidr_block,8, count.index )
  vpc_id               = aws_vpc.main_vpc.id
  availability_zone    = data.aws_availability_zones.azs.names[count.index % length(data.aws_availability_zones.azs.names)]


    tags   = {
      Name = "${var.env_name}-PrivateSubnet-${count.index+1}"
    }
}

resource "aws_subnet" "public_subnet" {
  count                = var.number_of_public_subnets
  cidr_block           = cidrsubnet(aws_vpc.main_vpc.cidr_block,8 ,count.index+var.number_of_private_subnets)
  vpc_id               = aws_vpc.main_vpc.id
  availability_zone    = data.aws_availability_zones.azs.names[count.index % length(data.aws_availability_zones.azs.names)]

  tags   = {
    Name = "${var.env_name}-PublicSubnet-${count.index+1}"
  }

  depends_on = [aws_subnet.private_subnet]

}

resource "random_integer" "random" {
  max = length(aws_subnet.public_subnet)
  min = 0
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id               = aws_vpc.main_vpc.id

   tags  = {
    name = "internet gw from terraform"
   }

}

resource "aws_eip" "nat_ip" {
}



resource "aws_nat_gateway" "nat_gateway" {
  allocation_id        = aws_eip.nat_ip.id
  subnet_id            = aws_subnet.public_subnet.*.id[random_integer.random.result]

   tags = {
    name = "nat gateway from terraform"
  }

}



output "public_subnets" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnets" {
  value = aws_subnet.private_subnet.*.id
}

output "random" {
  value = random_integer.random.result
}

output "azs" {
  value = data.aws_availability_zones.azs.names
}