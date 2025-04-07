
module "security_hub_acct_delegation" {
  source = "../../modules/securityhub-account-delegation"

  delegated_admin_account_id = "123456789012"
  region                     = "us-east-1"
}
