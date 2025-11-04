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
  description = "Map of VMs to be created"
  type = map(object({
    vm_name             = string
    location            = string
    resource_group_name = string
    vm_size             = string
    admin_username      = string
    subnet_name         = string
    vnet_name           = string
    nic_name            = optional(string)
    public_key_path     = optional(string)
    os_type             = optional(string, "linux")

    ip_configurations = optional(list(object({
      name                          = string
      private_ip_address_allocation = string
    })), [])

    # Optional OS disk block (all fields optional inside)
    os_disk = optional(object({
      caching              = optional(string)
      storage_account_type = optional(string)
      disk_size_gb         = optional(number)
    }), {})

    # Optional image reference block (all fields optional inside)
    source_image_reference = optional(object({
      publisher = optional(string)
      offer     = optional(string)
      sku       = optional(string)
      version   = optional(string)
    }), {})

    tags = optional(map(string), {})
  }))
}

