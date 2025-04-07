variable "region" {
  description = "AWS Region to deploy resources into"
}

variable "tags" {
  description = "A tag object to be utilized on all possible resources."
  type        = map(string)
  default     = {}
}

variable "specified_regions" {
  description = "List of AWS Regions to aggregate findings from"
  type        = list(any)
  default     = ["us-east-1", "us-west-2"]
}

variable "is_aggregate_region" {
  description = "Flag to indicate Region is the Findings Aggregate Region"
  type        = bool
  default     = false
}

variable "enable_notifications" {
  description = "Indicate whether to enable notification of Security Hub findings"
  type        = bool
  default     = false
}

variable "existing_sns_topic_arn" {
  description = "ARN of an existing SNS topic to send Security Hub findings notifiactions to. Leave blank to create a new SNS topic"
  type        = string
  default     = ""
}

variable "existing_members" {
  type = map(any)
}
