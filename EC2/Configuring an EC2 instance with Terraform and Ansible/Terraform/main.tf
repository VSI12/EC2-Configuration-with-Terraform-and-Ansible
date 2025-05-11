terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.97.0"
    }
  }

  required_version = ">= 1.7.5"
}

module "ec2" {
  source = "./modules/ec2"
}