variable "custom_ip" {
  description = "Custom IP allowed for SSH and HTTP, from root passed to modules"
  type        = string
}

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

variable "key_name" {
  description = "The name of the SSH key pair to associate with EC2 instances"
  type        = string
}


