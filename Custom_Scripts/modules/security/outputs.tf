output "security_group_id" {
  description = "The ID of the security group created"
  value       = aws_security_group.custom_sg.id
}
