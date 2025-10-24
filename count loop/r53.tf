resource "aws_route53_record" "www" {
  count = 4
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.terraform[count.index].private_ip].  # it will fetch IP from ec2_instance 
  allow-overwrite = true 
}