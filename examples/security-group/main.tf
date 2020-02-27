provider "aws" {
  region  = var.region
  profile = "eti"
}

module "security_group" {
  source = "../../modules/security-group"

  name = "${var.my_team}-${var.product}-${var.environment}"

  description = var.description
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["172.20.21.0/24"]
      security_groups  = ["sg-04f207a5915da6e23"]
      self             = null
      prefix_list_ids  = null
      ipv6_cidr_blocks = null
    },
    {
      from_port        = 80
      to_port          = 80
      protocol         = "udp"
      cidr_blocks      = ["0.0.0.0/0"]
      security_groups  = null
      self             = null
      prefix_list_ids  = null
      ipv6_cidr_blocks = null
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      security_groups  = null
      self             = null
      prefix_list_ids  = null
      ipv6_cidr_blocks = null
    },
  ]

  egress_rules = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      security_groups  = null
      self             = null
      prefix_list_ids  = null
      ipv6_cidr_blocks = null
    },
  ]

  tags = {
    Name        = "${var.my_team}-${var.product}-${var.environment}"
    environment = var.environment
    terraform   = true
  }
}
