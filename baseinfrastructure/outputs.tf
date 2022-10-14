output "resource_groups" {
  value = { for k, rg in azurerm_resource_group.this : k => rg.name }
}

output "vnet_ids" {
  value = { for k, vn in azurerm_virtual_network.this : k => vn.id }
}

output "subnet_ids" {
  value = { for k, sn in azurerm_subnet.this : k => sn.id }
}