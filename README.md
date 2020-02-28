![alt text](https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg)

# **tf-module-network**

Supported Resources:

* [VPC](https://www.terraform.io/docs/providers/aws/r/vpc.html)
* [Subnet](https://www.terraform.io/docs/providers/aws/r/subnet.html)
* [Route Table](https://www.terraform.io/docs/providers/aws/r/route_table.html)
* [Elastic IP](https://www.terraform.io/docs/providers/aws/r/eip.html)
* [NAT Gateway](https://www.terraform.io/docs/providers/aws/r/nat_gateway.html)
* [Internet Gateway](https://www.terraform.io/docs/providers/aws/r/internet_gateway.html)
* [Security Group](https://www.terraform.io/docs/providers/aws/r/security_group.html)
* [ALB](**coming soon**)
* [ELB](**coming soon**)
* [NLB](**coming soon**)
* [Listener](**coming soon**)
* [Route53](**coming soon**)

## Terraform Version
terraform 0.12

## Requirements
  - Terraform
  - AWS Account
  
## Dependencies
  - Not applicable.

## Example of Use
 ------
`VPC`:
```hcl
module "vpc" {
  source = "github.com/leandromoreirati/tf-module-network/modules/vpc"
  version = "~> 4.0.0"

  name                 = "{var.my_team}-{var.product}-{var.environment}"
  cidr_block           = var.cidr_block        
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames 
  
  tags = {
    environment = "${var.environment}"
    Name = "${var.my_team}-${var.product}-${var.environment}"
    terraform      = true
  }
}
```

`Subnet`:
```hcl
module "private_subnet" {
  source = "github.com/leandromoreirati/tf-module-network/modules/subnet"
  version = "~> 4.0.0"

  name                     = "{var.my_team}-{var.product}-{var.environment}"

  vpc_id                   = module.vpc.vpc_id
  cidr_block               = module.vpc.vpc_cidr_block
  az_count                 = var.az_count
  map_public_ip_on_launch  = var.map_public_ip_on_launch

  tags = {
    environment = "${var.environment}"
    Name = "${var.my_team}-${var.product}-${var.environment}"
    terraform      = true
  }
}
```
 
 `Route Table`:
```hcl
module "route_table" {
  source = "github.com/leandromoreirati/tf-module-network/modules/route-table"
  version = "~> 4.0.0"
  
  az_count = var.az_count
  vpc_id   = module.vpc.vpc_id
  private_subnet_id = module.private_subnet.private_subnet_id

  route_rules =[
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.internet_gateway.internet_gateway_id
      nat_gateway_id = ""
      transit_gateway_id = ""
      vpc_peering_connection_id = ""
    },
  ]

  tags = {
    environment = "${var.environment}"
    Name = "rt-private-subnet-${var.environment}"
    terraform     = true
  }

}
```

 `Elastic IP`:
```hcl
module "elastic_ip" {
  source = "github.com/leandromoreirati/tf-module-network/modules/elastic-ip"
  version = "~> 4.0.0"

  subnet_count = length(data.aws_subnet_ids.private.ids)

  tags = {
     Name            = "eip-${var.my_team}-${var.product}-${var.environment}"
     environment     = var.environment
     terraform       = true
  }
}
```
 `NAT Gateway`:
```hcl
module "nat_gateway" {
  source = "github.com/leandromoreirati/tf-module-network/modules/nat-gateway"
  version = "~> 4.0.0"

  subnet_count = length(data.aws_subnet_ids.private.ids)

  allocation_id     = module.elastic_ip.elastic_ip_id
  private_subnet_id = data.aws_subnet_ids.private.ids[*]

  tags = {
     Name            = "ng-${var.my_team}-${var.product}-${var.environment}"
     environment     = var.environment
     terraform       = true
  }
}
```

 `NAT Gateway`:
```hcl
module "nat_gateway" {
  source = "github.com/leandromoreirati/tf-module-network/modules/nat-gateway"
  version = "~> 4.0.0"

  subnet_count = length(data.aws_subnet_ids.private.ids)
  allocation_id = ["eipalloc-0f44c3d48e39f48ab",
                   "eipalloc-035995232234b185d",
                   "eipalloc-09f21475564212c3d"
                  ]
  private_subnet_id = ["subnet-0b13e74cbc4a854a4",
                       "subnet-0338537d482a6fd45",
                       "subnet-08ada95ce3df91472"
                      ] 

  tags = {
     Name            = "ng-${var.my_team}-${var.product}-${var.environment}"
     environment     = var.environment
     terraform       = true
  }
}
```
 `Internet Gateway`:
```hcl
module "internet_gateway" {
  source = "github.com/leandromoreirati/tf-module-network/modules/internet-gateway"
  version = "~> 4.0.0"

  vpc_id = module.vpc.vpc_id

  tags = {
    environment = "${var.environment}"
    Name = "${var.my_team}-${var.product}-${var.environment}"
    terraform      = true
  }
}
```

 `Security Group`:
```hcl
module "security_group" {
  source = "github.com/leandromoreirati/tf-module-network/modules/security-group"
  version = "~> 4.0.0"

  name = "${var.my_team}-${var.product}-${var.environment}"

  description   = var.description
  vpc_id        = var.vpc_id

  ingress_rules = [
    {
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_blocks = ["172.20.21.0/24"]
      security_groups = ["sg-04f207a5915da6e23"]
      self = null
      prefix_list_ids = null
      ipv6_cidr_blocks  = null
    },
    {
      from_port  = 80
      to_port    = 80
      protocol   = "udp"
      cidr_blocks = ["0.0.0.0/0"]
      security_groups = null
      self = null
      prefix_list_ids = null
      ipv6_cidr_blocks  = null
    },
    {
      from_port  = 443
      to_port    = 443
      protocol   = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      security_groups = null
      self = null
      prefix_list_ids = null
      ipv6_cidr_blocks  = null
    },
  ]

  egress_rules = [
    {
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      security_groups = null
      self = null
      prefix_list_ids = null
      ipv6_cidr_blocks  = null
    },
  ]

  tags = {
     Name"           = "${var.my_team}-${var.product}-${var.environment}"
     environment     = var.environment
     Terraform         = true 
  }
} 
```

# External Documentation
 - [VPC and Subnet](https://amzn.to/2T0tMGy)
 - [Route Table](https://amzn.to/2HJwKdf)
 - [Elastic IP](https://amzn.to/32hLitV)
 - [NAT Gateway](https://amzn.to/2vSgHHr)
 - [Internet Gateway](https://amzn.to/3bXR4oX)
 - [Security Group](https://amzn.to/2umcGus)

# Features
 ------
 - VPC
 - Subnet
 - Route Table
 - Elastic IP
 - NAT Gateway
 - Internet Gateway
 - Security Group
