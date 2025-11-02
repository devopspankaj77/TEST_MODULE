resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = try(each.value.dns_servers != null ? each.value.dns_servers : [] , [])
  tags                = try(each.value.tags != null ? each.value.tags : {}, {})
  dynamic "subnet" {
    for_each = try(each.value.subnets != null ? each.value.subnets : {}, {})
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
      service_endpoints = try(subnet.value.service_endpoints != null ? subnet.value.service_endpoints: [] ,[] )
      delegation = try(subnet.value.delegation != null ? subnet.value.delegation: [] , [] )
      
      # Optional NSG
      security_group = try(subnet.value.security_group != null ? subnet.value.security_group : [] , []  )  
      route_table_id = try(subnet.route_table_id != null ? subnet.value.route_table_id : [] , []  )  
    }
  }
}
