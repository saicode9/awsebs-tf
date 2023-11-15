terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
		}
	}
	required_version = ">= 0.14.9"
}       
provider "aws" {
        profile = "default"
	region = var.aws-region
}

resource "aws_s3_bucket" "webapp-bucket" {
    bucket = var.webapp-s3-bucket
}
resource "aws_s3_bucket_object" "webapp-s3-bucket_obj" {
    bucket = aws_s3_bucket.webapp-bucket.id
    key = "beanstalk/webapp.zip"
    source = "webapp.zip"  
}

resource "aws_elastic_beanstalk_application" "elastic-bean-webapp" {
  name  = "WebApp-Provisioned by TF"
  description = "WebApp"

}
resource "aws_elastic_beanstalk_application_version" "elastic-bean-webapp-ver" {
    bucket = aws_s3_bucket.webapp-bucket.id
    key = aws_s3_bucket_object.webapp-s3-bucket_obj.id
    application = aws_elastic_beanstalk_application.elastic-bean-webapp.name
    name = var.elastic-bean-webapp
}

resource "aws_elastic_beanstalk_environment" "elastic-bean-webapp-env" {
  name = var.elastic-bean-webapp-env
  application = aws_elastic_beanstalk_application.elastic-bean-webapp.name
  solution_stack_name = var.solution-stack-name
  description = "Web App using ElasticBeanStack-Flask-Python"
  version_label = aws_elastic_beanstalk_application_version.elastic-bean-webapp-ver.name

  setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "IamInstanceProfile"
      value = "aws-elasticbeanstalk-ec2-role"
  }
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = "200"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = 1
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = 2
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }

}
