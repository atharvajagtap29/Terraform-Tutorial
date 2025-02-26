terraform {

}

# In this file, I will provide examples of Structural Types like Object & Tuple

# Tuple
variable "example_tuple" {
  type    = tuple([string, number, bool])
  default = ["hello", 123, true]
}

# Object
variable "example_object" {
  type = object({
    name      = string
    age       = number
    is_active = bool
  })
  default = {
    name      = "John Doe"
    age       = 30
    is_active = true
  }
}

# OUTPUT variables
output "example_tuple_output" {
  value = var.example_tuple
}

output "example_object_output" {
  value = var.example_object
}


