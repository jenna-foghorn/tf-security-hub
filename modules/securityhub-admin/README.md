# Security Hub Admin
This module enables new AWS accounts created in the Organization to be automatically in Security Hub and invites existing AWS accounts to be members of Security Hub.

# Features
* Automatically enables Security Hub for new AWS accounts in the Organization
* Invites existing AWS accounts to be members of Security Hub
* Configures Security Hub Findings notification

# How to use

## Prerequisite
1. Ensure the deployment is executed by a user with appropriate permissions to the `Security Audit` account.

## Steps
1. Add the existing member accounts in the `existing_members` variable block as shown below
```
variable "existing_members" {
  type = map(any)

  default = {
    "member-1" = {
      "account_id" = "123456789012",
      "email"      = "member-1@foo.io",
    },
    ...
    ...
    "member-n" = {
      "account_id" = "987654321098",
      "email"      = "member-n@foo.io"
    }
  }
}
```
2. Optionally configure findings notification as below
* `enable_notifications`: set to `true` to enable notifications
* `existing_sns_topic_arn`: add the ARN of an existing SNS topic or leave blank to create a new SNS topic

3. Deploy with Terraform


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.24 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>5.24 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.security_hub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.security_hub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_securityhub_finding_aggregator.security_hub_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_finding_aggregator) | resource |
| [aws_securityhub_member.member](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_member) | resource |
| [aws_securityhub_organization_configuration.security_hub_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_organization_configuration) | resource |
| [aws_sns_topic.security_hub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.security_hub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_iam_policy_document.security_hub_sns_topic_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_notifications"></a> [enable\_notifications](#input\_enable\_notifications) | Indicate whether to enable notification of Security Hub findings | `bool` | `false` | no |
| <a name="input_existing_members"></a> [existing\_members](#input\_existing\_members) | n/a | `map(any)` | n/a | yes |
| <a name="input_existing_sns_topic_arn"></a> [existing\_sns\_topic\_arn](#input\_existing\_sns\_topic\_arn) | ARN of an existing SNS topic to send Security Hub findings notifiactions to. Leave blank to create a new SNS topic | `string` | `""` | no |
| <a name="input_is_aggregate_region"></a> [is\_aggregate\_region](#input\_is\_aggregate\_region) | Flag to indicate Region is the Findings Aggregate Region | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region to deploy resources into | `string` | `"us-east-2"` | no |
| <a name="input_specified_regions"></a> [specified\_regions](#input\_specified\_regions) | List of AWS Regions to aggregate findings from | `list(any)` | <pre>[<br>  "us-east-1",<br>  "us-west-2"<br>]</pre> | no |
| <a name="input_tag_map"></a> [tag\_map](#input\_tag\_map) | A default tag map to be placed on all possible resources created by this module. | `map` | <pre>{<br>  "CostCenter": "security",<br>  "Environment": "security",<br>  "Name": "security_hub",<br>  "Workload": "security_hub"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_auto_enable_new_members"></a> [auto\_enable\_new\_members](#output\_auto\_enable\_new\_members) | Auto-enable new accounts |
| <a name="output_findings_aggregator"></a> [findings\_aggregator](#output\_findings\_aggregator) | Security Hub Findings Aggregator |
| <a name="output_findings_notification"></a> [findings\_notification](#output\_findings\_notification) | Security Hub findings notifications configuration |
| <a name="output_invite_member"></a> [invite\_member](#output\_invite\_member) | Security Hub Member(s) invitation. |
<!-- END_TF_DOCS -->
