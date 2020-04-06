module "iam_service_account_role_label" {
  source    = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  namespace = var.namespace
  stage     = var.stage
  name      = var.name
}

resource "aws_iam_role" "service_account" {
  name               = module.iam_service_account_role_label.id
  assume_role_policy = data.aws_iam_policy_document.assume_role_with_oidc.json
}

resource "aws_iam_role_policy_attachment" "custom" {
  count = length(var.role_policy_arns) > 0 ? length(var.role_policy_arns) : 0

  role       = aws_iam_role.service_account.name
  policy_arn = var.role_policy_arns[count.index]
}
