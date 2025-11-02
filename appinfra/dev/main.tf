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
  vms    = var.vms

  depends_on = [ module.resource_group, module.network ]
} 