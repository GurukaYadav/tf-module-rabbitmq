resource "aws_route53_record" "rabbitmq" {
  zone_id = var.PRIVATE_HOSTED_ZONE_ID
  name    = "app-${var.ENV}-rabbitmq.roboshop.internal"
  type    = "A"
  ttl     = 300
  records = [aws_spot_instance_request.instance.spot_instance_id]
}