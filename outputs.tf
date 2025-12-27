output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_id # Souvent nommé cluster_id dans les ressources AWS
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}