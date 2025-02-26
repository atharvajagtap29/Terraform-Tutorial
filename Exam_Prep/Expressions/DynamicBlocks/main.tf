# Define the security group resource
resource "aws_security_group" "my-sg" {
  name        = "sg_via_terraform_1.2"
  description = "Allow inbound traffic on defined ports dynamically"

  # Use dynamic block for ingress rules
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_block
    }
  }

  # Egress Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "My new security group"
  }
}
