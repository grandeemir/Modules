# AWS Infrastructure Terraform Modules

A collection of professional, reusable, and versioned Terraform modules for deploying scalable AWS infrastructure. These modules follow **DRY (Don't Repeat Yourself)** principles and are designed for high availability and security.

## 🏗 Modular Architecture

This repository organizes AWS resources into logical components to ensure separation of concerns and maintainability:

- **VPC Module**: Custom networking with public/private subnets, IGW, and route tables.
- **Security Group Module**: Granular firewall rules for ALB, EC2, and RDS.
- **ELB Module**: Application Load Balancer setup with Target Groups and Listeners.
- **ASG Module**: Auto Scaling Group with Launch Templates for high availability.
- **RDS Module**: Secure, private database instances with automated subnet grouping.

## 🚀 Usage

To use these modules in your projects, reference them via Git tags to ensure infrastructure stability:

```hcl
module "vpc" {
  source = "git::[https://github.com/grandeemir/modules.git//modules/vpc?ref=v1.0.0](https://github.com/grandeemir/modules.git//modules/vpc?ref=v1.0.0)"

}