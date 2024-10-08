provider "aws" {
    region = var.aws_region
}

# Call SQS Module
module "sqs" {
    source = "./modules/sqs"
    queue_name = var.sqs_queue_name
}

# Call SNS Module
module "sns" {
    source = "./modules/sns"
    topic_name = var.sns_topic_name
    sqs_queue_arn = module.sqs.queue_arn   
}

