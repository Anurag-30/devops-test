variable "instance_type" {
  default = "t2.micro"
}

variable "env_name" {
  default = "test"
}

variable "aws_security" {
  type   =  list
}

variable "public_subnets" {
  type   = list
}

