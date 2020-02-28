provider "aws" {
  region  = var.region
  version = "~> 2.0"
  profile = var.profile
}

module "internet_gateway" {
  source = "../../modules/internet-gateway"

  vpc_id = module.vpc.vpc_id

  tags = {
    Name        = "${var.my_team}-${var.product}-${var.environment}"
    environment = "${var.environment}"
    terrafom    = true
  }

}