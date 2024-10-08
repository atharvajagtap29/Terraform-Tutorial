output "sqs_queue_arn" {
    value = module.sqs.queue_arn
}

output "sns_topic_arn" {
    value = module.sns.topic_arn
}