variable "aws-region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "elastic-bean-webapp-env" {
  description = "Application Env Name"
  type        = string
  default     = "elastic-bean-webapp-env"
}

variable "webapp-s3-bucket" {
  description = "S3 Bucket Name"
  type        = string
  default     = "jjjbbbwebapp"
}

variable "elastic-bean-webapp" {
  description = "Elastic BeanStack Application Name"
  type        = string
  default     = "Flash App"
}

variable "solution-stack-name" {
  description = "Elastic BeanStack for python Machine Type"
  type        = string
  default     = "64bit Amazon Linux 2023 v4.0.5 running Python 3.11"
}

variable "asg-mix" {
  description = "Minumum Number of Instance for the Application Needed, this will be setup in ASG"
  type        = string
  default     = "1"
}
variable "asg-max" {
  description = "Maximum Number of Instance for the Application Needed, this will be setup in ASG"
  type        = string
  default     = "4"
}
