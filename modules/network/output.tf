
output "vnet_ids" {
  description = "IDs of all created VNets"
  value = {
    for k, v in azurerm_virtual_network.vnet : k => v.id
  }
}

output "vnet_names" {
  description = "Names of all created VNets"
  value = {
    for k, v in azurerm_virtual_network.vnet : k => v.name
  }
}

output "subnet_ids" {
  description = "Subnet IDs within each VNet"
  value = {
    for vnet_key, vnet in azurerm_virtual_network.vnet :
    vnet_key => {
      for subnet_key, subnet in vnet.subnet :
      subnet_key => subnet.id
    }
  }
}