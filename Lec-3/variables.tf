variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-south-1"
}

variable "sqs_queue_name" {
  description = "Name of the SQS queue"
  type        = string
  default     = "my-sqs-queue"
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
  default     = "my-sns-topic"
}
