resource "aws_instance" "server_000" {
  ami           = "ami-0cd2fd776297f621a"
  instance_type = "t2.micro"
  key_name = aws_key_pair.ec2_key_pair.key_name
  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"

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

locals {
  project_name = "terra_learn"
}

variable "instance_type" {
  type = string

}
