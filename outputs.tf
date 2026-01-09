# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

# Public Subnet Outputs
output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "public_subnet_cidrs" {
  description = "CIDR blocks of public subnets"
  value       = aws_subnet.public[*].cidr_block
}

# Private Subnet Outputs
output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "private_subnet_cidrs" {
  description = "CIDR blocks of private subnets"
  value       = aws_subnet.private[*].cidr_block
}

# Database Subnet Outputs
output "database_subnet_ids" {
  description = "IDs of database subnets"
  value       = aws_subnet.database[*].id
}

output "database_subnet_cidrs" {
  description = "CIDR blocks of database subnets"
  value       = aws_subnet.database[*].cidr_block
}

# Security Group Outputs
output "alb_security_group_id" {
  description = "Security group ID for ALB"
  value       = aws_security_group.alb.id
}

output "app_security_group_id" {
  description = "Security group ID for application servers"
  value       = aws_security_group.app.id
}

output "database_security_group_id" {
  description = "Security group ID for RDS database"
  value       = aws_security_group.database.id
}

# EC2 Outputs
output "ec2_instance_ids" {
  description = "IDs of EC2 instances"
  value       = aws_instance.app[*].id
}

output "ec2_instance_private_ips" {
  description = "Private IP addresses of EC2 instances"
  value       = aws_instance.app[*].private_ip
}

output "ec2_iam_role_arn" {
  description = "ARN of IAM role for EC2 instances"
  value       = aws_iam_role.ec2_role.arn
}

# RDS Outputs
output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.main.endpoint
  sensitive   = true
}

output "rds_address" {
  description = "RDS database address (hostname)"
  value       = aws_db_instance.main.address
}

output "rds_port" {
  description = "RDS database port"
  value       = aws_db_instance.main.port
}

output "rds_database_name" {
  description = "RDS database name"
  value       = aws_db_instance.main.db_name
}

output "rds_engine" {
  description = "RDS database engine"
  value       = aws_db_instance.main.engine
}

output "rds_engine_version" {
  description = "RDS database engine version"
  value       = aws_db_instance.main.engine_version
}

# NAT Gateway Outputs
output "nat_gateway_ips" {
  description = "Elastic IPs of NAT Gateways"
  value       = aws_eip.nat[*].public_ip
}

# CloudWatch Outputs
output "cloudwatch_log_group_name" {
  description = "Name of CloudWatch Log Group for EC2 logs"
  value       = aws_cloudwatch_log_group.ec2_logs.name
}

output "cloudwatch_log_group_arn" {
  description = "ARN of CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.ec2_logs.arn
}

# Summary Output
output "infrastructure_summary" {
  description = "Summary of deployed infrastructure"
  value = {
    environment      = var.environment
    region           = var.aws_region
    vpc_cidr         = aws_vpc.main.cidr_block
    ec2_instance_count = length(aws_instance.app)
    rds_engine       = aws_db_instance.main.engine
    rds_address      = aws_db_instance.main.address
  }
}
