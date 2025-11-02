resource_groups = {
  rg1 = {
            name       = "dev-rg"
            location   = "eastus"
            managed_by = "dev-team"
  }

  rg2 = {
            name       = "prod-rg"
            location   = "eastus"
            managed_by = "prod-team"
  }
}


vnets = {
vnet1 = {
          name                = "dev-vnet"
          location            = "eastus"
          resource_group_name = "dev-rg"
          address_space       = ["10.1.0.0./16"]
          dns_servers         = ["dev-dns1"]

          subnets =     { subnet1 = {
                                  name             = "dev-subnet1"
                                address_prefixes = ["10.1.1.0/24"]
                                }
                        subnet2 = {
                                    name             = "dev-subnet2"
                                  address_prefixes = ["10.1.1.0/24"]
                                  }

}
vnet2 = {
   name                = "prod-vnet"
          location            = "eastus"
          resource_group_name = "dev-rg"
          address_space       = ["20.1.0.0./16"]
          dns_servers         = ["prod-dns1"]
}

}
}


network_security_groups = {
  web-nsg = {
                name                = "web-nsg"
                location            = "eastus"
                resource_group_name = "prod-rg"
                tags = {
                        environment = "production"
                        team        = "web"
                       }
                security_rules = [
                                  {
                                    name                       = "Allow-HTTP"
                                    priority                   = 100
                                    direction                  = "Inbound"
                                    access                     = "Allow"
                                    protocol                   = "Tcp"
                                    source_port_range          = "*"
                                    destination_port_range     = "80"
                                    source_address_prefixes     = ["*"]
                                    destination_address_prefixes = ["*"]
                                  },
                                  {
                                    name                       = "Allow-HTTPS"
                                    priority                   = 110
                                    direction                  = "Inbound"
                                    access                     = "Allow"
                                    protocol                   = "Tcp"
                                    source_port_range          = "*"
                                    destination_port_range     = "443"
                                    source_address_prefixes     = ["*"]
                                    destination_address_prefixes = ["*"] } ]
    
  }

  db-nsg = {
                name                = "db-nsg"
                location            = "eastus"
                resource_group_name = "prod-rg"
                tags = {
                        environment = "production"
                        team        = "database"
                       }
               
  } 
}

vms = {
    vm1 = {
         name                = "dev-vm1"
         location            = "eastus"
         resource_group_name = "dev-rg"
         ip_configurations = [
                              {
                                name                          = "ipconfig1"
                                subnet_id                     = "/subscriptions/a9fdd558-1514-4800-b1c1-4cf4c8760dc0/resourceGroups/dev-rg/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/dev-subnet1"
                                private_ip_address_allocation = "Dynamic"
                                    }
                            ]
    }}
       


