terraform {
  // Considers local state file as default backend when no configurations are provided here
}

# List
variable "example_list" {
  type    = list(string)
  default = ["API Development", "React.js", "AWS"]
}

# Map
variable "example_map" {
  type = map(number)
  default = {
    "a" = 1
    "b" = 2
    "c" = 3
  }
}

# Set
# In set the duplicates are not allowed, hence from below example the duplicates will be removed automatically
variable "example_set" {
  type    = set(string)
  default = ["apple, guava, banana", "guava", "mango"]
}


# OUTPUT variables
output "example_list_output" {
  value = var.example_list
}

output "example_map_output" {
  value = var.example_map
}

output "example_set_output" {
  value = var.example_set
}
