provider "aws" {
  region  = var.region
  version = "~> 2.0"
  profile = var.profile
}

module "vpc" {
  source = "../../modules/vpc"

  name                 = "{var.my_team}-{var.product}-{var.environment}"
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name        = "${var.my_team}-${var.product}-${var.environment}"
    environment = "${var.environment}"
    terraform   = true
  }

}
