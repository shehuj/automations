terraform/
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   └── eks/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
└── environments/
    └── prod/
        ├── backend.tf
        ├── main.tf
        ├── variables.tf
        └── terraform.tfvars

✅ What you get:
- Multi-AZ VPC with public/private subnets
- NAT gateways
- EKS cluster with managed node group (m5.large)
- IRSA enabled
- Flexible tagging and fully parameterized

1️⃣ Install Prerequisites:
- Terraform v1.3+
- AWS CLI v2+ configured with proper credentials
- kubectl

run code:
> cd terraform/environments/prod
> terraform init
> terraform plan
> terraform apply -auto-approve