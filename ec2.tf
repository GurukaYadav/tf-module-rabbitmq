resource "aws_spot_instance_request" "instance" {
  ami           = data.aws_ami.ami.image_id
  spot_price    = data.aws_ec2_spot_price.spot_price.spot_price
  instance_type = var.INSTANCE_TYPE
  wait_for_fulfillment = true

  tags = {
    Name = "${local.TAG_NAME}-instance"
  }
}

resource "aws_ec2_tag" "tag" {
  resource_id = aws_spot_instance_request.instance.spot_instance_id
  key         = "Name"
  value       = "local.TAG_NAME"
}

resource "aws_instance" "web"

  provisioner "remote-exec" {
  connection {
    type     = "ssh"
    user     = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["SSH_USER"]
    password = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["SSH_PASS"]
    host     = self.public_ip
  }
    inline = [
      "ansible-pull -U https://github.com/GurukaYadav/roboshop-ansible.git roboshop.yml -e HOST=RABBITMQ -e ROLE=rabbitmq",
    ]
  }
}

