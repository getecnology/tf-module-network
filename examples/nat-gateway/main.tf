provider "aws" {
  region  = var.region
  version = "~> 2.0"
  profile = var.profile
}

data "aws_vpc" "default" {
  state = "available"

  filter {
    name   = "tag:Name"
    values = ["lms-bucket-infraestrutura-staging"]
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.default.id
}

module "elastic_ip" {
  source = "../../modules/vpc"

  subnet_count = length(data.aws_subnet_ids.private.ids)

  tags = {
    Name        = "eip-${var.my_team}-${var.product}-${var.environment}"
    environment = var.environment
    terraform   = true
  }
}

module "nat_gateway" {
  source = "../../modules/nat-gateway"

  subnet_count = length(data.aws_subnet_ids.private.ids)

  allocation_id     = module.elastic_ip.elastic_ip_id
  private_subnet_id = data.aws_subnet_ids.private.ids[*]

  tags = {
    Name        = "ng-${var.my_team}-${var.product}-${var.environment}"
    environment = var.environment
    terraform   = true
  }
}