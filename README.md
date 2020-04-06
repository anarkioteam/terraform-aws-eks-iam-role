# terraform-aws-eks-iam-role

A Terraform module for creating an EKS IAM service account role.

## Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | ~> 0.12.0 |
| aws       | ~> 2.56   |

## Providers

| Name | Version |
| ---- | ------- |
| aws  | ~> 2.56 |

## Inputs

| Name                                      | Description                                                      | Type           | Default | Required |
| ----------------------------------------- | ---------------------------------------------------------------- | -------------- | ------- | :------: |
| eks_cluster_name                          | EKS cluster name                                                 | `string`       | n/a     |   yes    |
| external_dns_oidc_fully_qualified_subject | Service account OIDC FQS                                         | `string`       | n/a     |   yes    |
| name                                      | Name of solution (i.e. `cert-manager`)                           | `string`       | n/a     |   yes    |
| namespace                                 | Namespace (i.e. `anarkio`)                                       | `string`       | n/a     |   yes    |
| oidc_fully_qualified_subjects             | The fully qualified OIDC subjects to be added to the role policy | `list(string)` | n/a     |   yes    |
| role_policy_arns                          | List of ARNs of IAM policies to attach to IAM role               | `list(string)` | `[]`    |    no    |
| stage                                     | Stage (i.e. `dev`, `stg`, `prd`, `infra`)                        | `string`       | n/a     |   yes    |

## Outputs

| Name              | Description                          |
| ----------------- | ------------------------------------ |
| eks_iam_role_name | Name of EKS IAM service account role |
