resource "aws_route53_record" "learning_subdomain" {
  zone_id = var.route53_zone_id
  name    = var.subdomain_name    
  type    = var.type
  # ttl     = var.ttl
  # records = [var.records]

  alias {
    name                   = var.alb_dns_name        #aws_lb.utc_load_balancer.dns_nameReplace with your Load Balancer DNS name
    zone_id                = var.alb_zone_id         #aws_lb.utc_load_balancer.zone_id   Replace with your Load Balancer Zone ID
    evaluate_target_health = var.evaluate_target_health
  }
}

//this bloc is used if you want to create a hosted_zone from crash
# resource "aws_route53_domain" "utc_domain" {
#   domain_name = "yourdomain.com"  # Replace with your desired domain name
# }

# resource "aws_route53_zone" "utc_hosted_zone" {
#   name = "yourdomain.com"         # Root domain for the hosted zone
# }

# resource "aws_route53_record" "learning_subdomain" {
#   zone_id = aws_route53_zone.utc_hosted_zone.id
#   name    = "learning.yourdomain.com"
#   type    = "A"
#   ttl     = 300

#   alias {
#     name                   = aws_lb.utc_load_balancer.dns_name
#     zone_id                = aws_lb.utc_load_balancer.zone_id
#     evaluate_target_health = true
#   }
# }
