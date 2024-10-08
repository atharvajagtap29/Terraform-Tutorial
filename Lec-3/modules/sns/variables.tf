variable "topic_name" {
    description = "The name of the SNS Topic"
    type = string
}

variable "sqs_queue_arn" {
    description = "ARN of the SQS Queue to subscribe to SNS topic"
    type = string
}