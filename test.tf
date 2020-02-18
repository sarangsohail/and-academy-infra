resource "aws_s3_bucket" "test" {
  bucket = "and-academy-infra-sarang-test1"
}
resource "aws_route53_zone" "main" {
  name = "sarangsohail.aa.dekker.and.digital"
}

output "main_name_servers" {
  value = aws_route53_zone.main.name_servers
}

resource "aws_route53_record" "record" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "www.sarangsohail.aa.dekker.and.digital"
  type    = "A"
  ttl     = "300"
  records = ["1.2.3.4"]
}
