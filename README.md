# EKS_Cluster_with_Terraform
Infrastructure as Code (IaC) to deploy an Amazon EKS (Elastic Kubernetes Service) cluster on AWS with a modular architecture and secure remote state.

## This project deploys a complete Kubernetes infrastructure on AWS, including:

Managed EKS cluster with high availability

Dedicated VPC with multi-AZ public and private subnets

Configurable Node Groups for Kubernetes workers

Remote Terraform backend with S3 + DynamoDB for secure state management

Modular architecture for maximum reusability



## Architecture
<img width="431" height="627" alt="Capture d’écran du 2025-12-27 15-06-05" src="https://github.com/user-attachments/assets/22819e28-7a2e-44bd-a69e-7943b141eb0b" />



## Main Components

### 1. Terraform Backend

S3 Bucket: Stores Terraform state centrally and securely

DynamoDB Table: Manages state locks to prevent concurrent modifications

This is the foundation that enables teamwork and state security

### 2. VPC Module

Creates an isolated network on AWS with:

Public subnets (for load balancers and NAT gateways)

Private subnets (for Kubernetes workers)

Multi-AZ for high availability

Internet Gateway and NAT Gateway for connectivity




### 3. EKS Module

Deploys an AWS-managed Kubernetes cluster

Configures node groups (worker groups)

Manages IAM roles and policies

Configures the EKS control plane

### 4. Main Configuration (main.tf)

Orchestras the VPC and EKS modules

Configures the remote S3 backend

Defines the AWS providers

### Workflow

#### 1. Backend Setup

└─> Creates S3 + DynamoDB

#### 2. Terraform Init

└─> Connects to the S3 backend

#### 3. Terraform Plan/Apply

├─> VPC module creates the network
└─> EKS module deploys Kubernetes

#### 4. kubectl Configuration

└─> Connects to the EKS cluster

## Installation

#### Clone the project

Do this on an EC2 instance!!!

git clone

cd <your-repo>

#### Configure AWS CLI

aws configure

#### Create the S3 + DynamoDB Backend

cd backend

terraform init

terraform plan

terraform apply -auto-approve

cd..

#### Deployment

terraform init

terraform plan

terraform apply

#### Configure kubectl 

Retrieve kubeconfig configuration

aws eks update-kubeconfig --region us-east-1 --name <cluster_name>

Check connection

kubectl get nodes

kubectl get pods --all-namespaces

------------------------------------------------------------------------------------------------------------------
I am open to any contributions

give me a star if you like the project
Add me on LinkedIn :  www.linkedin.com/in/théodore-jeriel-massima


