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