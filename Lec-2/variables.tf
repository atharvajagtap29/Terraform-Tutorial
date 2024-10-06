variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The name of the key for SSH access"
  type        = string
}
