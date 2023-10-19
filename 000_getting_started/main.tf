terraform {
  backend "remote" {
      organization = "mshellik"
      workspaces {
        name = "terraform-associate-labs"
      }
    }
  }
provider "aws"  {
      access_key = "XXXXXXXXXXXXXXXXXXXXXXXXX"
      secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXX"
      region = "ap-southeast-2"
}