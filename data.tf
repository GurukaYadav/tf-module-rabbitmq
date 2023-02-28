data "aws_ami" "ami" {
  //executable_users = ["self"]
  most_recent      = true
  name_regex       = "base-with-ansible"
  owners           = ["self"]
}

data "aws_ec2_spot_price" "spot_price" {
  instance_type     = "t3.medium"
  availability_zone = data.aws_subnet.selected.availability_zone

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

data "aws_subnet" "selected" {
  id = "subnet-0c36349846844693b"
}

output "avinash" {
  value = data.aws_subnet.selected
}