data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

locals {
  eks_cluster_identity_issuer_url = replace(data.aws_eks_cluster.this.identity.0.oidc.0.issuer, "https://", "")

  aws_account_id = data.aws_caller_identity.current.account_id
}

data "aws_iam_policy_document" "assume_role_with_oidc" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type = "Federated"

      identifiers = [
        "arn:aws:iam::${local.aws_account_id}:oidc-provider/${local.eks_cluster_identity_issuer_url}"
      ]
    }

    dynamic "condition" {
      for_each = var.oidc_fully_qualified_subjects
      content {
        test     = "StringEquals"
        variable = "${local.eks_cluster_identity_issuer_url}:sub"
        values   = [condition.value]
      }
    }
  }
}
