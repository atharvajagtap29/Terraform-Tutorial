variable "subnet_id" {
  description = "Subnet ID where EC2 will be deployed"
  type        = string
}

variable "ami_id" {
  description = "Amazon Machine Image (AMI) ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro" # Default value
}

variable "security_group_id" {
  description = "Security Group ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The SSH key pair name passed from the root module to be used for EC2 instances"
  type        = string
}
