resource "aws_route_table" "route_table" {

  vpc_id  = aws_vpc.main_vpc.id

    tags  = {

      Name = "Public-RouteTable"

    }

}

resource "aws_route" "public-subnet-route" {

  route_table_id             = aws_route_table.route_table.id
  destination_cidr_block     = "0.0.0.0/0"
  gateway_id                 = aws_internet_gateway.internet_gateway.id
  depends_on                 = [aws_route_table.route_table,aws_internet_gateway.internet_gateway]

}

resource "aws_route_table_association" "public_association" {

  count                      = length(aws_subnet.public_subnet)
  route_table_id             = aws_route_table.route_table.id
  //subnet_id                = element(aws_subnet.public_subnet.*.id, count.index) --> Older way of accessing the list
  subnet_id                  = aws_subnet.public_subnet.*.id[count.index]

}

resource "aws_route_table" "private-route-table" {
  vpc_id                     = aws_vpc.main_vpc.id

  tags   = {
    Name = "Private-Route-Table"
  }

}

resource "aws_route" "private-subnet-route" {

  route_table_id             = aws_route_table.private-route-table.id
  destination_cidr_block     = "0.0.0.0/0"
  nat_gateway_id             = aws_nat_gateway.nat_gateway.id

}

resource "aws_route_table_association" "private_subnet_association" {
  count                      = length(aws_subnet.public_subnet)
  route_table_id             = aws_route_table.private-route-table.id
  subnet_id                  = aws_subnet.private_subnet.*.id[count.index]
}