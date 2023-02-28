#resource "aws_instance" "web" {
#  ami           = data.aws_ami.ami.image_id
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "HelloWorld"
#  }
#}
#
#resource "aws_spot_instance_request" "instance" {
#  ami           = data.aws_ami.ami.image_id
#  spot_price    = "0.0031"
#  instance_type = "t3.medium"
#
#  tags = {
#    Name = "CheapWorker"
#  }
#}