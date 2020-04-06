data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

locals {
  eks_cluster_identity_oidc_issuer_arn = data.aws_eks_cluster.this.identity.0.oidc.0.arn
  eks_cluster_identity_oidc_issuer     = data.aws_eks_cluster.this.identity.0.oidc.0.issuer
}

data "aws_iam_policy_document" "assume_role_with_oidc" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type = "Federated"

      identifiers = [
        local.eks_cluster_identity_oidc_issuer_arn
      ]
    }

    dynamic "condition" {
      for_each = var.oidc_fully_qualified_subjects
      content {
        test     = "StringEquals"
        variable = "${replace(local.eks_cluster_identity_oidc_issuer, "https://", "")}:sub"
        values   = [condition.value]
      }
    }
  }
}
