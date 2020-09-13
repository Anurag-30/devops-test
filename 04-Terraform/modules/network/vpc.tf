resource "aws_vpc" "main_vpc" {

  cidr_block   = var.cidr_block
   tags  = {
    Name = "${var.env_name}-vpc"

  }

}