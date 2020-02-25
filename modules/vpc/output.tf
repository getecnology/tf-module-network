output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "ID of the VPC."
}

output "vpc_arn" {
  value       = aws_vpc.vpc.arn
  description = "ARN of VPC."
}

output "vpc_cidr_block" {
  value       = aws_vpc.vpc.cidr_block
  description = "CIDR block of the VPC."
}