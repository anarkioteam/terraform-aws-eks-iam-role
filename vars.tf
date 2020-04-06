variable "namespace" {
  type        = string
  description = "Namespace (i.e. `anarkio`)"
}

variable "stage" {
  type        = string
  description = "Stage (i.e. `dev`, `stg`, `prd`, `infra`)"
}

variable "name" {
  type        = string
  description = "Name of solution (i.e. `cert-manager`)"
}

variable "external_dns_oidc_fully_qualified_subject" {
  type        = string
  description = "Service account OIDC FQS"
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "role_policy_arns" {
  description = "List of ARNs of IAM policies to attach to IAM role"
  type        = list(string)
  default     = []
}

variable "oidc_fully_qualified_subjects" {
  description = "The fully qualified OIDC subjects to be added to the role policy"
  type        = list(string)
}
