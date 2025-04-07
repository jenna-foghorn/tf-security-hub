# Security Hub Admin's - Account Delegation (management/payor account)
The Terraform module delegates the designated AWS account as Security Hub Admin for the organization

# How to use

## Prerequisites
1. Ensure the deployment is executed by a user with appropriate permissions to the `management/payer` account.

## Steps
1. Identify the AWS account to delegate as the Security Hub Administrator. This is typically your Security (or Audit) AWS account, and not the Account ID.
2. Edit the `variables.tf` file and update the `delegated_admin_account_id` variable with the Account ID noted in step 1 above.
3. Deploy with Terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_securityhub_account.security_hub_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_account) | resource |
| [aws_securityhub_organization_admin_account.security_hub_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_organization_admin_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_enable_controls"></a> [auto\_enable\_controls](#input\_auto\_enable\_controls) | Indicate whether to automatically enable new controls when they are added to standards that are enabled | `bool` | `true` | no |
| <a name="input_control_finding_generator"></a> [control\_finding\_generator](#input\_control\_finding\_generator) | Indicate whether the calling account has consolidated control findings turned on | `string` | `"STANDARD_CONTROL"` | no |
| <a name="input_delegated_admin_account_id"></a> [delegated\_admin\_account\_id](#input\_delegated\_admin\_account\_id) | Account ID to designate as the Security Hub administrator account. | `number` | n/a | yes |
| <a name="input_enable_default_standards"></a> [enable\_default\_standards](#input\_enable\_default\_standards) | Indicate whether to enable the security standards that Security Hub has designated as automatically enabled | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A tag object to be utilized on all possible resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_hub_admin"></a> [security\_hub\_admin](#output\_security\_hub\_admin) | Organization Security Hub Admin |
<!-- END_TF_DOCS -->
