output "ec2_instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.custom_ec2.id
}

output "key_name" {
  description = "The SSH key pair name assigned to the EC2 instance"
  value       = var.key_name
}
