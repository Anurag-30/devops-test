data aws_ami "image_id"{

  #owners     = ["aws-marketplace"]  # using ami from Amazon market place , should be self (security practice)
  owners      = ["120116087690"]
  most_recent = true

  filter {
    name      = "name"
    values    = ["Centos 7*"]
  }

  filter {
    name      = "root-device-type"
    values    = ["ebs"]
  }

}

output "images" {
  value = [data.aws_ami.image_id.*.image_id]
}