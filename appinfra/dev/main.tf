module "resource_group" {
  source          = "../../modules/resource_group"
  resource_groups = var.resource_groups
}

module "network" {
  source = "../../modules/network"
  vnets  = var.vnets
  
  depends_on = [ module.resource_group ]
}

module "network_security_group" {
  source                 = "../../modules/network_security_group"
  network_security_groups = var.network_security_groups

  depends_on = [ module.resource_group ]
}



module "virtual_machine" {
  source = "../../modules/virtual_machine"

  vms = {
    devvm = {
      vm_name             = "dev-linux-vm"
      location            = module.resource_group.resource_group_locations["rg1"]
      resource_group_name = module.resource_group.resource_group_names["rg1"]
      vm_size             = "Standard_B1s"
      admin_username      = "azureuser"
      subnet_name         = "dev-subnet-1"
      vnet_name           = "dev-vnet"

      ip_configurations = [
        {
          name                          = "internal"
          private_ip_address_allocation = "Dynamic"
        }
      ]
    }
  }

  depends_on = [module.resource_group]
}
