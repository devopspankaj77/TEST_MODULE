variable "network_security_groups" {
  description = "A map of network security groups to create."
  type = map(object({
    name                = string 
    location            = string
    resource_group_name = string
    tags = optional(map(string), {})
    security_rules = optional(list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = optional(string)
      destination_port_range     = optional(string)
      source_address_prefixes     = optional(list(string))
      destination_address_prefixes = optional(list(string))
    })), [])
    }))
}
