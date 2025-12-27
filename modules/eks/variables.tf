variable "cluster_name" {
    description = "The name of the EKS cluster"
    type        = string
    default     = "my-eks-cluster"
}

variable "cluster_version" {
    description = "The Kubernetes version for the EKS cluster"
    type        = string
    default     = "1.31"
  
}

variable "subnet_ids" {
    description = "subnet IDs"
    type        = list(string)
  
}

variable "vpc_id" {
    description = "VPC ID"
    type        = string
  
}

variable "node_groups" {
  description = "EKS node group configuration"
  type = map(object({
    instance_types = list(string)
    capacity_type  = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  }))
}