output "resource_group_names" {
  description = "Map of RG keys to names"
  value       = { for rg_key, rg_obj in azurerm_resource_group.rg : rg_key => rg_obj.name }
}

output "resource_group_ids" {
  description = "Map of RG keys to IDs"
  value       = { for rg_key, rg_obj in azurerm_resource_group.rg : rg_key => rg_obj.id }
}

output "resource_group_locations" {
  description = "Map of RG keys to locations"
  value       = { for rg_key, rg_obj in azurerm_resource_group.rg : rg_key => rg_obj.location }
}
