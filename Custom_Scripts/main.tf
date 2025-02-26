terraform {
  # You can specify remote backend setup if any, here
}

# Call security module in main
module "security" {
  source    = "./modules/security"
  custom_ip = var.custom_ip
}

# Call EC2 module in main
module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  security_group_id = module.security.security_group_id # Reference output variable of security group module
  subnet_id         = var.subnet_id
  key_name          = var.key_name
}
