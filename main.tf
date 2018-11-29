provider "aws" {
  region     = "us-east-1"
}

//--------------------------------------------------------------------
// Modules
module "ec2_instance" {
  source  = "app.terraform.io/JoeStack/ec2-instance/aws"
  version = "1.13.0"

  ami = "ami-048fac6b039d41144"
  instance_type = "t2.small"
  name = "jboero-testing"
  subnet_id = "${module.vpc.private_subnets}"
  vpc_security_group_ids = "${module.vpc.default_security_group_id}"
  
}

module "vpc" {
  source  = "app.terraform.io/JoeStack/vpc/aws"
  version = "1.46.0"
  cidr = "10.0.0.0/16"
}
