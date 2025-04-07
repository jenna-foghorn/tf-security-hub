# Enable Security Hub in local account
resource "aws_securityhub_account" "security_hub_admin" {
  enable_default_standards  = var.enable_default_standards
  control_finding_generator = var.control_finding_generator
  auto_enable_controls      = var.auto_enable_controls
}

# Delegate account as Security Hub admin
resource "aws_securityhub_organization_admin_account" "security_hub_admin" {
  admin_account_id = var.delegated_admin_account_id
}
