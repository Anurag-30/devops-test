variable "cidr_block" {
 default = "10.0.0.0/16"
}

variable "number_of_private_subnets" {
  default = "3"
}

variable "number_of_public_subnets" {
  default = "3"
}

variable "env_name" {
  default = "test"
}

variable "instance_type" {}