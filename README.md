# Setting up AWS Elastic Bean Stack (EBS) using Terraform

This terraform code is created in order to accomplish the below requirements

# Requirements:

Create a Highly Available simple Web Application in the AWS Public Cloud infrastructure. 

# Consideration:

Creating a simple WebApp in python with flask for this sample application.
Also copy ensure to copy the zip file, unless you have your code. If you are have your own code, please change the file name in the main.cf

This terraform code will deploy/create Elastic Beanstack in AWS using Amazon Linux, Python and Flash. Also this will create a new Auto Scaling Group, to ensure that the syetem will work and provide both Performance (when needed) and High Availability (HA) in the even of the Instance dies. It will also create new Load Balancer to provdie the HA.

# Customising the variables for your needs.

Change the below variables in the vars.tf file.

```
aws-region ==> The region where you would like to have this setup

webapp-s3-bucket ==> S3 bucket name for creating

elastic-bean-webapp ==> Application Name in EBS

elastic-bean-webapp-env ==> EBS Application's Environment name

solution-stack-name ==> EBS - OS/Application Stack Name to be used for creaing this Application.
```

# Deploying the Code / Creating an instance with Terraform
In Order to Deploy after adding the vars.tf file, run the below commands.
```
terraform init
terraform validate
terraform plan
terraform apply
```
# Testing the HA-AutoScaling

Once the code has been deployed, you can test the High Availability and Autoscaling. 
This can be done by either shotdowning the box from the AWS console or awscli. 

Within few mins a new instance will be added to this deployment automatically based on the AutoScalling Group settings.

# Destorying the Setup
In Order to remove the instance/setup, just run the below command.

```
terraform destroy
```
