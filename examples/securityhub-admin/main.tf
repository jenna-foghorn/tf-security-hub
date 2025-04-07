module "security_hub_admin" {
  source = "../../modules/securityhub-admin"

  existing_members = {}
  region           = "us-east-1"

  # enable notification (optional)
  is_aggregate_region  = true
  enable_notifications = true
}
