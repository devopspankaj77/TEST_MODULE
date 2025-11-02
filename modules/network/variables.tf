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
