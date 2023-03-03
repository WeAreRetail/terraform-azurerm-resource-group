output "name" {
  value       = azurerm_resource_group.self.name
  description = "Resource group name"
}

output "id" {
  value       = azurerm_resource_group.self.id
  description = "Resource group id"
}

output "location" {
  value       = azurerm_resource_group.self.location
  description = "Resource group location"
}
