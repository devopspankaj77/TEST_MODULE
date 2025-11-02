data "azurerm_subnet" "data_subnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

output "subnet_id" {
  value = data.azurerm_subnet.data_subnet.id
}
