variable "resource_groups" {
  description = "A map of resource group names to create."
  type        = map(object({
    name     = string
    location = string
    managed_by = optional(string)
  }))
  }
variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string), [])
    tags                = optional(map(string), {})
    subnet = optional(map(object({
      name              = string
      address_prefixes  = list(string)
      service_endpoints = optional(list(string))
      delegation        = optional(list(string))
      security_group    = optional(string)
      route_table_id    = optional(string)
      nsg_name = optional(string)      # <- Extra
    })), {})
  }))
}


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


variable "vms" {
    type = map(object({
        name                = string 
        location            = string 
        resource_group_name = string 
        ip_configurations = list(object({
                    name                          = string
                    private_ip_address_allocation = string
  }))
     
    }))
    }