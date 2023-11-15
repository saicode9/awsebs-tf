output "dns_endpoint" {
    value = "http://${aws_elastic_beanstalk_environment.elastic-bean-webapp-env.endpoint_url}/"
}
