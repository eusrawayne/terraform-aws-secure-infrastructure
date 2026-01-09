# terraform-aws-secure-infrastructure

## Overview

This is a production-ready Infrastructure as Code (IaC) project using Terraform to deploy a secure, multi-tier AWS architecture. Built for Kyndryl DevOps Engineers and Cloud Architects.

### Key Features

✅ **Secure VPC Architecture** - Multi-tier setup with public, private, and isolated subnets  
✅ **Security Groups** - Least-privilege network access controls  
✅ **IAM Best Practices** - Hardened roles and policies with minimal permissions  
✅ **Encrypted RDS** - Database with encryption at rest and in transit  
✅ **CloudWatch Monitoring** - Centralized logging and alarms  
✅ **Cost Optimization** - Multi-environment support (dev/prod)  
✅ **Modular Design** - Reusable Terraform modules for scalability

---

## Architecture Overview

This infrastructure implements industry-standard security practices:

- **Public Subnets**: NAT Gateways, Application Load Balancer (ALB)
- **Private Subnets**: Application servers with restricted egress
- **Isolated Database Subnets**: RDS with encryption and Multi-AZ
- **Security Groups**: Enforce least-privilege access
- **IAM Roles**: Temporary credentials for EC2 instances
- **CloudWatch**: Centralized monitoring and alerting

---

## Project Structure

```
terraform-aws-secure-infrastructure/
├── README.md                    # Project documentation
├── main.tf                      # Root module configuration
├── variables.tf                 # Input variable definitions
├── outputs.tf                   # Output values
├── terraform.tfvars.example     # Example configuration
│
├── modules/
│   ├── network/                 # VPC, Subnets, Gateways
│   ├── compute/                 # EC2, Auto Scaling, ALB
│   ├── database/                # RDS with encryption
│   └── iam/                     # IAM Roles & Policies
│
└── envs/
    ├── dev/                     # Development environment
    └── prod/                    # Production environment
```

---

## Prerequisites

- **Terraform** >= 1.0
- **AWS CLI** configured with valid credentials
- **AWS Account** with appropriate IAM permissions
- **Git** for version control

---

## Getting Started

### 1. Clone Repository

```bash
git clone https://github.com/eusrawayne/terraform-aws-secure-infrastructure.git
cd terraform-aws-secure-infrastructure
```

### 2. Configure Variables

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
```

### 3. Initialize & Plan

```bash
terraform init
terraform plan -out=tfplan
```

### 4. Apply Configuration

```bash
terraform apply tfplan
```

### 5. Retrieve Outputs

```bash
terraform output
```

---

## Security Features

✅ Network segmentation by tier  
✅ Encryption at rest (RDS + KMS)  
✅ Encryption in transit (SSL/TLS)  
✅ IAM least-privilege access  
✅ CloudWatch centralized logging  
✅ VPC Flow Logs for network monitoring  
✅ Multi-AZ high availability  
✅ Automated backups and point-in-time recovery

---

## Cleanup

```bash
terraform destroy
```

---

## Technologies & Alignment

Demonstrates expertise in technologies for **Kyndryl DevOps** roles:

- Infrastructure as Code (Terraform)
- AWS services (VPC, EC2, RDS, IAM, CloudWatch)
- Cloud security and compliance
- Network architecture
- Database management
- DevOps best practices

---

## Resources

- [Terraform AWS Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS VPC Best Practices](https://docs.aws.amazon.com/vpc/)
- [AWS Security](https://aws.amazon.com/security/)
- [Kyndryl](https://www.kyndryl.com/)

---

## Contact

📧 LinkedIn: [Carita Fonseca](https://www.linkedin.com/in/carita-fonseca/)  
💻 GitHub: [@eusrawayne](https://github.com/eusrawayne)

**Last Updated**: January 2026
