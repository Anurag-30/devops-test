resource "null_resource" "create_ssh_keys" {

  provisioner "local-exec" {
      command = "yes y | ssh-keygen -q -t rsa -f public_ec2_key_pair -N '' "
  }
}

data "local_file" "pub_content"  {
  filename = "public_ec2_key_pair.pub"
  depends_on = [null_resource.create_ssh_keys]
}

resource "aws_key_pair" "create_aws_key_pair" {
  public_key = data.local_file.pub_content.content
}