output "security_group_id" {
  description = "The ID of the security group created by the security module"
  value       = module.security.security_group_id
}

output "ec2_instance_id" {
  description = "The instance ID. That the EC2 module created"
  value       = module.ec2.ec2_instance_id
}

output "key_name" {
  description = "The SSH key pair name used for EC2 instances"
  value       = module.ec2.key_name
}
