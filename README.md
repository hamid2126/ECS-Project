# End-to-End ECS Fargate Automated Deployment on AWS 

## Overview
This project demonstrates a containerised application automatically deployed to AWS using Docker, Terraform and CI/CD pipelines.

---

**Key Features:**

- Multi-stage Docker image
- Infrastructure as Code (Terraform)
- CI/CD pipelines (Github Actions with OIDC)

---

## Architecture Diagram


---
**Diagram Overview:**

- **ECS Fargate** for serverless container execution
- **VPC** with public and private subnets across 2 AZs
- **NAT Gateway** for private AWS service access
- **Application Load Balancer (ALB)** deployed in public subnets
- **ECS tasks** running in private subnets
- **Route 53 + ACM certificate**
- Terraform remote state stored in **S3** with lockfile-based state locking

---
## Repo Structure

```

└── ./
├── .github
│   └── workflows
│       ├── apply.yaml
│       ├── destroy.yaml
│       └──  docker.yaml
├── app
│    └── dockerfile         # alongside application code
├── infra
│   ├── modules
│   │   ├── acm/
│   │   ├── alb/
│   │   ├── ecs/
│   │   ├── iam/
│   │   ├── route 53/
│   │   ├── security_groups/
│   │   └── vpc/
│   ├── backend.tf
│   ├── main.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── variables.tf                
├── .gitignore
└── README.md
```
---
## CI/CD Pipelines
**Github Actions** automates:

- Building the Docker image and pushing it to the ECR
- Infrastructure deployment through terraform init, plan and apply
- Tearing down the infrastructure through terraform destroy
---
## Deployment Proof


---
## Pipelines Success Proof


---
## Tech Stack
- **Cloud:** AWS
- **Infrastructure as Code:** Terraform
- **Containerisation:** Docker
- **CI/CD:** GitHub Actions
- **Authentication:** OIDC
---
