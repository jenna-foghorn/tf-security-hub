# Auto enable security hub in organization member accounts
resource "aws_securityhub_organization_configuration" "security_hub_admin" {
  auto_enable = true
}

# configure findings aggregation from multiple Regions into primary Region
resource "aws_securityhub_finding_aggregator" "security_hub_admin" {
  count = var.is_aggregate_region ? 1 : 0

  linking_mode      = "SPECIFIED_REGIONS"
  specified_regions = var.specified_regions
}

# Invite existing members
resource "aws_securityhub_member" "member" {
  for_each = var.existing_members

  account_id = each.value.account_id
  email      = each.value.email
  invite     = false

  lifecycle {
    ignore_changes = [
      # Workaround for issues with provider
      email,
      invite,
    ]
  }
}

# ------------------------------------------
# Security Hub Subscriptions
# ------------------------------------------
resource "aws_securityhub_product_subscription" "this" {
  for_each    = var.product_config != null ? { for product in var.product_config : product.arn => product } : {}
  product_arn = each.value.arn
}

resource "aws_securityhub_standards_subscription" "this" {
  for_each = var.standards_config != null ? { for standards in local.standards_subscription : standards.arn => standards if standards.enable } : {}

  standards_arn = each.value.arn
}

# ------------------------------------------
# Security Hub Action Targets
# ------------------------------------------
resource "aws_securityhub_action_target" "this" {
  for_each = var.action_target != null ? { for target in var.action_target : target.identifier => target } : {}

  name        = each.value.name
  identifier  = each.value.identifier
  description = each.value.description
}
