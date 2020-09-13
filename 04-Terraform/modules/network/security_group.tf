resource "aws_security_group" "instances_security_groups" {
  name                =  "allow_access"
  description         =  "Allow ssh inbound traffic"
  vpc_id              =  aws_vpc.main_vpc.id

  ingress {

    description = "Allow-ssh from public"
    from_port         =  0
    to_port           =  2222
    protocol          =  "tcp"
    cidr_blocks       =  [aws_vpc.main_vpc.cidr_block,"0.0.0.0/0"]

  }

  egress {

    from_port         =  0
    to_port           =  0
    protocol          =  "-1"
    cidr_blocks       =  ["0.0.0.0/0"]

  }

  tags = {
    Name             =  "allow_access"
  }

}



output "security_groups_id" {

  value = aws_security_group.instances_security_groups.id

}

