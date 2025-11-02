# 🧠 Soch (Why we need multiple outputs)

# Jab tu NSG module likhta hai, to uske outputs chahiye:

# NSG IDs — taaki dusre module (like subnet association, NIC, etc.) use kar saken.

# NSG Names — reporting aur debugging ke liye.

# NSG Locations — kabhi kabhi use hoti hai tagging, policy me.

# NSG Rules Summary — ek readable list sab rules ki (enterprise dashboards me useful).

# 🧱 Step-by-step — Output Blocks:
# 🧩 1️⃣ NSG IDs
# Har NSG ka ID nikal le, taaki networking resources me attach kar sake.



# Output: NSG Names
output "nsg_names" {
  description = "Map of NSG keys to their names"
  value = {
    for key, nsg in azurerm_network_security_group.nsg :
    key => nsg.name
  }
}

# Output: NSG IDs
output "nsg_ids" {
  description = "Map of NSG keys to their IDs"
  value = {
    for key, nsg in azurerm_network_security_group.nsg :
    key => nsg.id
  }
}

# Output: NSG Locations
output "nsg_locations" {
  description = "Map of NSG names to their Azure locations"
  value = {
    for key, nsg in azurerm_network_security_group.nsg :
    nsg.name => nsg.location
  }
}

# Output: NSG Rules Summary (optional but enterprise-style)
output "nsg_rules_summary" {
  description = "Summary of all NSG rules for auditing/reporting"
  value = {
    for key, nsg in azurerm_network_security_group.nsg : key => [
      for rule in try(nsg.security_rule, []) : {
        name        = rule.name
        direction   = rule.direction
        access      = rule.access
        priority    = rule.priority
        protocol    = rule.protocol
      }
    ]
  }
}
