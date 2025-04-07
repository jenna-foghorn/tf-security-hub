# tf-security-hub

A collection of Terraform submodules to enable and configure Security Hub

# Features
* Enable Security hub for the AWS Organization in the managed Regions
* Designates an account (Security Audit) as the Security Hub admin account
* Invites member accounts that were created before enabling Security Hub to be managed by Security Hub
* Automatically manages any new account created in the Organization
* Configures Security Hub Findings notification

# Overview
The following are the deployment order for the submodules

## `securityhub-account-delegation` TF module
This module enables trusted access to Security Hub in the Payer account and delegates the Security Audit account as the Security Hub admin account.

This module is executed in the **Payer account**.

## `securityhub-admin` TF module
This module automatically enables security Hub for new accounts in the organization and adds the existing accounts that were created in the organization before enabling Security Hub.Also configures the notifications of Security Findings

This should be run by a user with appropriate permissions in the **Security (Audit) account**.

See details [HERE](./modules/securityhub-admin/README.md)
