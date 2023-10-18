resource "aws_instance" "server_000" {
  ami           = "ami-0cd2fd776297f621a"
  instance_type = var.instance_type

  tags = {
    name = "server_000-${local.project_name}"
  }
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc_server_000"
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-2a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
