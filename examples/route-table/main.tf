provider "aws" {
  region  = var.region
  version = "~> 2.0"
  profile = var.profile
}

module "vpc" {
  /* source = "git::https://github.com/leandromoreirati/tf-module-s3.git" */
  source = "../network/vpc"

  name                 = "{var.my_team}-{var.product}-{var.environment}"
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Environment    = "${var.environment}"
    Service_type   = "${var.service_type}"
    Business_owner = "${var.business_owner}"
    Name           = "${var.my_team}-${var.product}-${var.environment}"
  }

}

module "private_subnet" {
  /* source = "git::https://github.com/leandromoreirati/tf-module-s3.git" */
  source = "../network/subnet"

  name = "{var.my_team}-{var.product}-{var.environment}"

  vpc_id                  = module.vpc.vpc_id
  cidr_block              = module.vpc.vpc_cidr_block
  az_count                = var.az_count
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Environment    = "${var.environment}"
    Service_type   = "${var.service_type}"
    Business_owner = "${var.business_owner}"
    Name           = "${var.my_team}-${var.product}-${var.environment}"
  }

}

module "internet_gateway" {
  source = "../network/internet-gateway"

  vpc_id = module.vpc.vpc_id

  tags = {
    Environment    = "${var.environment}"
    Service_type   = "${var.service_type}"
    Business_owner = "${var.business_owner}"
    Name           = "${var.my_team}-${var.product}-${var.environment}"
  }

}

module "route_table" {
  source = "../../modules/route-table"

  az_count          = var.az_count
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.private_subnet.private_subnet_id

  route_rules = [
    {
      cidr_block                = "0.0.0.0/0"
      gateway_id                = module.internet_gateway.internet_gateway_id
      nat_gateway_id            = ""
      transit_gateway_id        = ""
      vpc_peering_connection_id = ""
    },
  ]

  tags = {
    Name        = "rt-private-subnet-${var.environment}"
    environment = "${var.environment}"
    terraform   = true
  }

}