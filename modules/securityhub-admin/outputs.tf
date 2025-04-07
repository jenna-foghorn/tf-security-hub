output "auto_enable_new_members" {
  description = "Auto-enable new accounts"
  value       = aws_securityhub_organization_configuration.security_hub_admin
}

output "invite_member" {
  description = "Security Hub Member(s) invitation."
  value       = aws_securityhub_member.member
}

output "findings_aggregator" {
  description = "Security Hub Findings Aggregator"
  value       = aws_securityhub_finding_aggregator.security_hub_admin
}

output "findings_notification" {
  description = "Security Hub findings notifications configuration"
  value = {
    notifications_enabled  = var.enable_notifications
    existing_sns_topic_arn = var.existing_sns_topic_arn != "" ? var.existing_sns_topic_arn : null
    new_sns_topic_arn      = var.existing_sns_topic_arn == "" && var.enable_notifications ? aws_sns_topic.security_hub.*.arn : null
  }
}
