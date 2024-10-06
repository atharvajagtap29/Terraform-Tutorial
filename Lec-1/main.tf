# Specify the service provider and the region
provider "aws" {
  region = "ap-south-1" # Set the AWS region to Mumbai [ap-south-1]
}

# Create an S3 bucket
resource "aws_s3_bucket" "bucket-1" {     # The 2 parametes here are: a) aws resource name b) variable name in this file
  bucket = "terraform-lovers-bucket-4687" # globally unique name, just like s3 requires

  # enable versioning for the bucket
  versioning {
    enabled = true
  }

  # Server side encryption config
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256" # Enabled server side encryption with AES256
      }
    }
  }

  # Enable versioning for the bucket
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Create a new security group for ec2
resource "aws_security_group" "new_ec2_sg" {
  name        = "sg_via_terraform_ec2"
  description = "Allow inbound traffic on port 22 and 80 i.e SSH & HTTP"

  # inbound [ingress]
  ingress {
    # here we provide from & to, to specify the port range. Now since we are targeting 1 port, we keep from & to the same.
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # from anywhere
  }

  # inbound [ingress]
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # from anywhere
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1" # -1 means allow all outbound traffic
  }

  tags = {
    Name = "New EC2 Security Group"
  }
}

# Create an EC2 instance
resource "aws_instance" "ec2-1" {
  ami                    = "ami-078264b8ba71bc45e" # Example AMI for Amazon Linux 2. region is gonna be ap-south-1 only
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0d91a2b35c14f1051"
  vpc_security_group_ids = [aws_security_group.new_ec2_sg.id] # Associate the new security group with the instance

  # key pair for ssh access
  key_name = "Test_KP_Cloud.in" # add your existing key pair

  tags = {
    Name        = "My EC2 Instance"
    Environment = "Dev"
  }

}
