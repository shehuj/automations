provider "aws" {
  region = var.region
}

module "vpc" {
  source          = "../../modules/vpc"
  region          = var.region
  name            = "${var.cluster_name}-vpc"
  cidr            = var.cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  tags            = { Environment = "prod" }
}

module "eks" {
  source          = "../../modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = concat(module.vpc.private_subnets, module.vpc.public_subnets)
  vpc_id          = module.vpc.vpc_id
  tags            = { Environment = "prod" }
}