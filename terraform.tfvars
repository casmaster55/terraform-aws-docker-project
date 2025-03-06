#environment variables
region       = "us-east-1"
project_name = "rentzone"
environment  = "dev"

#vpv variables
vpc_cidr                     = "10.0.0.0/16"
public_subnet_az1_cidr       = "10.0.0.0/24"
public_subnet_az2_cidr       = "10.0.1.0/24"
private_app_subnet_az1_cidr  = "10.0.2.0/24"
private_app_subnet_az2_cidr  = "10.0.3.0/24"
private_data_subnet_az1_cidr = "10.0.4.0/24"
private_data_subnet_az2_cidr = "10.0.5.0/24"

#security-group variables
ssh_location="172.58.181.144/32"

#rds variables
datababe_snapshot_identifier="shopwise-snapshot"
database_instance_class="db.t3.micro"
datababe_instance_identifier="dev-rds-db"
multi_az_deployment="false"

#acm variablecheck
domain_name="djomodevops.com"
alternative_names="*.djomodevops.com"


#s3 variables 
env_file_bucket="rentzone-casmaster55-ecs-env-file-bucket"
env_file_name="rentzone.env"

#ecs variables
architecture="X86_64"
container_image="503561421721.dkr.ecr.us-east-1.amazonaws.com/rentzone-repo:latest"


#route 53 variables 
record_name="www"
