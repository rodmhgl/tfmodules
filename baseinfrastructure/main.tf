locals {
  tags = { module = path.module }
}

resource "azurerm_resource_group" "this" {
  for_each = var.resource_groups
  name     = each.value.resource_group_name
  location = each.value.resource_group_location
  tags     = merge(var.tags, local.tags)
}

resource "azurerm_virtual_network" "this" {
  for_each            = var.virtual_networks
  location            = azurerm_resource_group.this[each.value.resource_group_key].location
  resource_group_name = azurerm_resource_group.this[each.value.resource_group_key].name
  name                = each.value.name
  address_space       = each.value.address_space
  dns_servers         = try(each.value.dns_servers, null)
  tags                = merge(var.tags, local.tags)
}

resource "azurerm_subnet" "this" {
  for_each                                      = var.subnets
  resource_group_name                           = azurerm_resource_group.this[each.value.resource_group_key].name
  virtual_network_name                          = azurerm_virtual_network.this[each.value.vnet_key].name
  name                                          = each.value.name
  address_prefixes                              = each.value.address_prefixes # list
  private_endpoint_network_policies_enabled     = try(each.value.private_endpoint_network_policies_enabled, true)
  private_link_service_network_policies_enabled = try(each.value.private_link_service_network_policies_enabled, true)
  #TODO: #1 Add dynamic delegation block
  #TODO: #2 Add service endpoint support
  #TODO: #3 Add service endpoint policy id support
  #TODO: #4 Add service delegation block support
}

#TODO: #5 Add Network Security Group and NSG Subnet Assoociation support
/*
resource "azurerm_network_security_group" "this" {
  name = ""
} */