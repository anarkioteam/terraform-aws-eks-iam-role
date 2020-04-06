output "eks_iam_role_name" {
  description = "Name of EKS IAM service account role"
  value       = aws_iam_role.service_account.name
}
