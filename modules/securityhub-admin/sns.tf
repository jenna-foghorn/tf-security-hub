resource "aws_sns_topic" "security_hub" {
  count = var.enable_notifications && var.is_aggregate_region && var.existing_sns_topic_arn == "" ? 1 : 0

  name_prefix = "security-hub-findings-"

  tags = {
    "Name" = "security-hub-findings"
  }
}

resource "aws_sns_topic_policy" "security_hub" {
  count = var.enable_notifications && var.is_aggregate_region && var.existing_sns_topic_arn == "" ? 1 : 0

  arn    = aws_sns_topic.security_hub[0].arn
  policy = data.aws_iam_policy_document.security_hub_sns_topic_policy[0].json
}

data "aws_iam_policy_document" "security_hub_sns_topic_policy" {
  count = var.enable_notifications && var.is_aggregate_region && var.existing_sns_topic_arn == "" ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.security_hub[0].arn]
  }
}
