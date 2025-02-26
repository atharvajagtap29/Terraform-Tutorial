variable "aws_region" {
  description = "AWS region for resources creation"
  type        = string
}

variable "ingress_rules" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_block = list(string)
  }))
}
