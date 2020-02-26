provider "aws" {
  region  = var.region
  version = "~> 2.0"
  profile = var.profile
}


module "private_subnet" {
  source = "../../modules/subnet"

  name = "{var.my_team}-{var.product}-{var.environment}"

  vpc_id                  = module.vpc.vpc_id
  cidr_block              = module.vpc.vpc_cidr_block
  az_count                = var.az_count
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name        = "${var.my_team}-${var.product}-${var.environment}"
    environment = "${var.environment}"
    terraform   = true
  }
}
