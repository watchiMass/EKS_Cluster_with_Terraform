terraform {
    required_version = ">= 1.0.0"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }

    backend "s3" {
        bucket         = "terraform-eks-state-s3-bucket-watchi"
        key            = "terraform.tfstate"
        region         = "us-east-1"
        dynamodb_table = "terraform-eks-state-locks"
        encrypt        = true
    }

}

provider "aws" {
        region = "us-east-1"
    }


module "vpc" {
    source = "./modules/vpc"

    cluster_name          = var.cluster_name
    vpc_cidr              = var.vpc_cidr
    public_subnet_cidrs   = var.public_subnet_cidrs
    private_subnet_cidrs  = var.private_subnet_cidrs
    availability_zones   = var.availability_zones
  
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  node_groups     = var.node_groups
}