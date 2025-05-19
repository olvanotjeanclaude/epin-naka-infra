# 📘 Common AWS Resources in Terraform

This document lists the most commonly used AWS resources in Terraform, especially relevant for Laravel + Next.js deployments.

---

## 🖥️ Compute & Networking

| Resource                        | Purpose                                 |
|---------------------------------|-----------------------------------------|
| `aws_instance`                  | Launch EC2 virtual machines             |
| `aws_key_pair`                 | Upload SSH key for EC2 access           |
| `aws_security_group`           | Configure firewall rules                |
| `aws_eip`                      | Allocate and attach static IP addresses |
| `aws_vpc`                      | Create Virtual Private Cloud            |
| `aws_subnet`                   | Subdivide VPC                           |
| `aws_internet_gateway`        | Public internet access for the VPC      |
| `aws_route_table`             | Routing between subnets and gateways    |
| `aws_network_interface`       | Additional ENIs for EC2 or services     |

---

## 🗃️ Database

| Resource                        | Purpose                           |
|---------------------------------|-----------------------------------|
| `aws_db_instance`               | RDS MySQL, PostgreSQL, etc.       |
| `aws_db_subnet_group`          | Group of subnets for DB placement |
| `aws_rds_cluster`              | Aurora DB cluster                 |

---

## 💾 Storage

| Resource                        | Purpose                            |
|---------------------------------|------------------------------------|
| `aws_s3_bucket`                 | Object/file storage (images, etc.) |
| `aws_s3_bucket_object`         | Store/upload files to S3           |
| `aws_ebs_volume`                | Extra disk for EC2                 |

---

## 🔐 IAM (Identity & Access Management)

| Resource                        | Purpose                           |
|---------------------------------|-----------------------------------|
| `aws_iam_role`                  | IAM role for EC2, Lambda, etc.    |
| `aws_iam_policy`                | Define IAM permissions            |
| `aws_iam_instance_profile`      | Attach IAM roles to EC2           |

---

## 🌍 DNS & SSL

| Resource                        | Purpose                           |
|---------------------------------|-----------------------------------|
| `aws_route53_zone`              | DNS zone for a domain             |
| `aws_route53_record`            | DNS records (A, CNAME, TXT)       |
| `aws_acm_certificate`           | Free SSL certificates from ACM    |

---

## 🛠️ DevOps & Automation

| Resource                        | Purpose                           |
|---------------------------------|-----------------------------------|
| `aws_codepipeline`              | CI/CD pipelines                   |
| `aws_codedeploy_app`            | Code deployment services          |
| `aws_lambda_function`           | Run code serverlessly             |

---

## 🧠 Recommended Use for Laravel + Next.js Stack

- **EC2**: `aws_instance`, `aws_key_pair`, `aws_security_group`
- **Database**: `aws_db_instance`
- **Storage**: `aws_s3_bucket` for file uploads
- **DNS + SSL**: `aws_route53_record`, `aws_acm_certificate`
- **Elastic IP**: `aws_eip`