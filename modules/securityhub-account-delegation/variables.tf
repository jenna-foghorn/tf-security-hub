variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "delegated_admin_account_id" {
  description = "Account ID to designate as the Security Hub administrator account."
  type        = number
}

variable "enable_default_standards" {
  description = "Indicate whether to enable the security standards that Security Hub has designated as automatically enabled"
  type        = bool
  default     = true
}

variable "control_finding_generator" {
  description = "Indicate whether the calling account has consolidated control findings turned on"
  type        = string
  default     = "STANDARD_CONTROL"
}

variable "auto_enable_controls" {
  description = "Indicate whether to automatically enable new controls when they are added to standards that are enabled"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A tag object to be utilized on all possible resources."
  type        = map(string)
  default     = {}
}
