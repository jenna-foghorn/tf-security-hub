resource "aws_cloudwatch_event_rule" "security_hub" {
  count = var.enable_notifications && var.is_aggregate_region ? 1 : 0

  name        = "security-hub-findings-notification"
  description = "Capture each Security Hub Findings (Imported)"

  event_pattern = jsonencode(
    {
      "source" : [
        "aws.securityhub"
      ],
      "detail-type" : [
        "Security Hub Findings - Imported"
      ]
    }
  )

  tags = {
    "Name" = "security-hub-findings-notification"
  }
}

resource "aws_cloudwatch_event_target" "security_hub" {
  count = var.enable_notifications && var.is_aggregate_region ? 1 : 0

  rule = aws_cloudwatch_event_rule.security_hub[0].name
  arn  = var.existing_sns_topic_arn != "" ? var.existing_sns_topic_arn : aws_sns_topic.security_hub[0].arn
}
