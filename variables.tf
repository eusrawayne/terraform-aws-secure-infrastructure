# AWS Region
variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

# Project naming
variable "project_name" {
  description = "Project name for resource naming and tagging"
  type        = string
  default     = "secure-infra"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

# VPC Configuration
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private (application) subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "database_subnet_cidrs" {
  description = "CIDR blocks for database (isolated) subnets"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "availability_zones" {
  description = "Availability zones for multi-AZ deployment"
  type        = list(string)
  default     = ["a", "b"]
}

# EC2 Configuration
variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 2

  validation {
    condition     = var.ec2_instance_count >= 1 && var.ec2_instance_count <= 10
    error_message = "Instance count must be between 1 and 10."
  }
}

variable "ec2_root_volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 20
}

# RDS Configuration
variable "rds_engine" {
  description = "RDS database engine (postgres or mysql)"
  type        = string
  default     = "postgres"

  validation {
    condition     = contains(["postgres", "mysql"], var.rds_engine)
    error_message = "RDS engine must be postgres or mysql."
  }
}

variable "rds_engine_version" {
  description = "RDS database engine version"
  type        = string
  default     = "14.7"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 20
}

variable "rds_username" {
  description = "Master username for RDS"
  type        = string
  sensitive   = true
  default     = "admin"
}

variable "rds_password" {
  description = "Master password for RDS (should be at least 8 characters)"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "appdb"
}

variable "rds_backup_retention" {
  description = "RDS backup retention period in days"
  type        = number
  default     = 7
}

variable "rds_multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = true
}

# Security Configuration
variable "enable_vpc_flow_logs" {
  description = "Enable VPC Flow Logs"
  type        = bool
  default     = true
}

variable "enable_cloudwatch_logs" {
  description = "Enable CloudWatch Logs for EC2"
  type        = bool
  default     = true
}

# Tags
variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    "Project"     = "secure-infra"
    "ManagedBy"   = "Terraform"
    "CreatedDate" = "2026-01-09"
  }
}
