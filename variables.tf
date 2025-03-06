# The AWS region where resources will be created.
variable "region" {
  description = "The AWS region where resources will be created (e.g., us-east-1)."
  type        = string
}

# The name of the project, used for naming resources.
variable "project_name" {
  description = "The name of the project, used to prefix resource names (e.g., my-project)."
  type        = string
}

# The environment where the project will be deployed (e.g., dev, staging, prod).
variable "environment" {
  description = "The environment where the project will be deployed (e.g., dev, staging, prod)."
  type        = string
}

#vpv variables
# The CIDR block for the VPC (e.g., 10.0.0.0/16).
variable "vpc_cidr" {
  description = "The CIDR block for the VPC (e.g., 10.0.0.0/16)."
  type        = string
}

# The CIDR block for the public subnet in Availability Zone 1.
variable "public_subnet_az1_cidr" {
  description = "The CIDR block for the public subnet in Availability Zone 1 (e.g., 10.0.1.0/24)."
  type        = string
}

# The CIDR block for the public subnet in Availability Zone 2.
variable "public_subnet_az2_cidr" {
  description = "The CIDR block for the public subnet in Availability Zone 2 (e.g., 10.0.2.0/24)."
  type        = string
}

# The CIDR block for the private app subnet in Availability Zone 1.
variable "private_app_subnet_az1_cidr" {
  description = "The CIDR block for the private app subnet in Availability Zone 1 (e.g., 10.0.3.0/24)."
  type        = string
}

# The CIDR block for the private app subnet in Availability Zone 2.
variable "private_app_subnet_az2_cidr" {
  description = "The CIDR block for the private app subnet in Availability Zone 2 (e.g., 10.0.4.0/24)."
  type        = string
}

# The CIDR block for the private data subnet in Availability Zone 1.
variable "private_data_subnet_az1_cidr" {
  description = "The CIDR block for the private data subnet in Availability Zone 1 (e.g., 10.0.5.0/24)."
  type        = string
}

# The CIDR block for the private data subnet in Availability Zone 2.
variable "private_data_subnet_az2_cidr" {
  description = "The CIDR block for the private data subnet in Availability Zone 2 (e.g., 10.0.6.0/24)."
  type        = string
}

# The IP address or CIDR block allowed to SSH into the bastion host or other servers.
variable "ssh_location" {
  description = "The IP address or CIDR block allowed to SSH into the bastion host or other servers (e.g., 203.0.113.0/24)."
  type        = string
}


#rds variables
variable "datababe_snapshot_identifier" {
  description = "database snapshot name"
  type        = string
}

variable "database_instance_class" {
  description = "database instance type"
  type        = string
}


variable "datababe_instance_identifier" {
  description = "database instance identifier"
  type        = string
}


variable "multi_az_deployment" {
  description = "create a standby bd instance"
  type        = bool 
}


#acm variables 
variable "domain_name" {
  description = "domain name"
  type        = string 
}

variable "alternative_names" {
  description = "sub domain name"
  type        = string
}



#s3 variables 
variable "env_file_bucket" {
  description = "s3 bucket name"
  type        = string
}


variable "env_file_name" {
  description = "env file name"
  type        = string
}


#ecs variables
variable "architecture" {
  description = "ecs cpu architecture"
  type        = string
}


variable "container_image" {
  description = "container image url"
  type        = string
}

#route 53 variables 
variable "record_name" {
  description = "sub domain name"
  type        = string
}