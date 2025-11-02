variable "resource_groups" {
  description = "A map of resource group names to create."
  type        = map(object({
    name     = string
    location = string
    managed_by = optional(string)
  }))
  }


