# EKS_Cluster_with_Terraform
Infrastructure as Code (IaC) to deploy an Amazon EKS (Elastic Kubernetes Service) cluster on AWS with a modular architecture and secure remote state.

## Ce projet déploie une infrastructure Kubernetes complète sur AWS incluant :

Cluster EKS managé avec haute disponibilité

VPC dédié avec subnets publics et privés multi-AZ

Node Groups configurables pour les workers Kubernetes

Backend Terraform distant avec S3 + DynamoDB pour la gestion d'état sécurisée

Architecture modulaire pour une réutilisabilité maximale



## Architecture
<img width="431" height="627" alt="Capture d’écran du 2025-12-27 15-06-05" src="https://github.com/user-attachments/assets/22819e28-7a2e-44bd-a69e-7943b141eb0b" />



## Composants Principaux

### 1. Backend Terraform

S3 Bucket : Stocke l'état Terraform de manière centralisée et sécurisée

DynamoDB Table : Gère les verrous d'état pour éviter les modifications concurrentes

C'est la fondation qui permet le travail en équipe et la sécurité de l'état


### 2. Module VPC

Crée un réseau isolé sur AWS avec :

Subnets publics (pour les load balancers, NAT gateways)

Subnets privés (pour les workers Kubernetes)

Multi-AZ pour la haute disponibilité

Internet Gateway et NAT Gateway pour la connectivité




### 3. Module EKS


Déploie un cluster Kubernetes managé par AWS

Configure les node groups (groupes de workers)

Gère les IAM roles et policies

Configure le control plane EKS


### 4. Configuration Principale (main.tf)
   

Orchestre les modules VPC et EKS

Configure le backend S3 distant

Définit les providers AWS

### Workflow

#### 1. Backend Setup

   └─> Crée S3 + DynamoDB

#### 2. Terraform Init

   └─> Se connecte au backend S3

#### 3. Terraform Plan/Apply

   ├─> Module VPC crée le réseau
   └─> Module EKS déploie Kubernetes
   

#### 4. kubectl Configuration

   └─> Se connecte au cluster EKS

## Installation

#### Cloner le projet

Fais le sur une instance EC2 !!!

git clone 

cd <votre-repo>

#### Configurer AWS CLI

aws configure

#### Créer le Backend S3 + DynamoDB

cd backend

terraform init

terraform plan

terraform apply -auto-approve

cd ..

#### Déploiement

terraform init

terraform plan 

terraform apply

#### Configurer kubectl

 Récupérer la configuration kubeconfig
 
aws eks update-kubeconfig --region us-east-1 --name <cluster_name>

Vérifier la connexion

kubectl get nodes

kubectl get pods --all-namespaces

------------------------------------------------------------------------------------------------------------------
I am open to any contributions

give me a star if you like the project

Add me on LinkedIn :  www.linkedin.com/in/théodore-jeriel-massima


