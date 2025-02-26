variable "instances" {
  type = list(map(string))
}

output "all_instances_name" {
  value = var.instances[*].name # Extracts all the name fields using the splat ([*].name)
}

output "all_instances_types" {
  value = var.instances[*].type # Extracts all the name fields using the splat ([*].name)
}

output "first_instance_info" {
  value = var.instances[0] # Selects the first instance in the list
}

output "formatted_instance" {
  value = [for instance in var.instances : "${instance.name} instance is of ${instance.type} type."]
}
