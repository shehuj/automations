terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.35, < 6.0"
    }
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  enable_irsa             = true
  # manage_aws_auth_configmap is not supported in this module version and has been removed

  node_security_group_additional_rules = {
    ingress_allow_ssh = {
      description = "Allow SSH"
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
      type        = "ingress"
    }
  }

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    disk_size             = 50
  }

  eks_managed_node_groups = {
    main = {
      desired_capacity = 3
      max_capacity     = 6
      min_capacity     = 2
      instance_types = ["m5.large"]
      capacity_type  = "ON_DEMAND"
      map_public_ip_on_launch = true
    }
  }

  tags = var.tags
}