resource "aws_instance" "custom_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id] # 👈 Use the security group from the module

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    
    # Install Docker
    sudo yum install -y docker
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo usermod -aG docker ec2-user  # Allow ec2-user to run Docker without sudo

    # Install Git
    sudo yum install -y git
  EOF

  tags = {
    Name = "custom-ec2-instance"
  }
}
