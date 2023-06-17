module "aws_vpc" {
    source = "value"
    vpc_name =var.vpc_name
  
}
module "subnet_id" {
    source = "../data/aws/vpc_subnetid_by_type"
    vpc_id  =module.aws_vpc.id
    subnet_type = var.subnet_type
    subnet_availability_zones = var.subnet_az
  
}

module "aws_vpc" {
    source = "value"
    vpc_name =var.vpc_name
  
}
module "ami_name" {
    source = "../data/aws/ec2_amiid_by_name"
    ami_name = var.ami_name
  
}
module "security_group" {
    source = "../data/aws/vpc_security_groupid_by_name"
    vpc_id = module.aws_vpc_id
    security_group_names = var.security_group_names
        
    }
  