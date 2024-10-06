
resource "aws_s3_bucket" "bucket-1" {
  bucket = var.bucket_name

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "my-bucket"
    Environment = "Dev"
  }
}

resource "aws_security_group" "new_ec2_sg" {
  name        = "sg_via_terraform_ec2"
  description = "Allow inbound traffic on port 22 and 80 i.e SSH & HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }

  tags = {
    Name = "New EC2 Security Group"
  }
}

resource "aws_instance" "ec2-1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.new_ec2_sg.id]

  key_name = var.key_name

  tags = {
    Name        = "My EC2 Instance"
    Environment = "Dev"
  }
}
