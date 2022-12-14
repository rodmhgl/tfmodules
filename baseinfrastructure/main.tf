locals {
  tags = { module = path.module }
}

resource "azurerm_resource_group" "this" {
  for_each = var.resource_groups
  name     = each.key
  location = each.value.resource_group_location
  tags     = merge(var.tags, local.tags)
}

resource "azurerm_virtual_network" "this" {
  for_each            = var.virtual_networks
  location            = azurerm_resource_group.this[each.value.resource_group_key].location
  resource_group_name = azurerm_resource_group.this[each.value.resource_group_key].name
  name                = each.key
  address_space       = each.value.address_space
  dns_servers         = try(each.value.dns_servers, null)
  tags                = merge(var.tags, local.tags)
}

resource "azurerm_subnet" "this" {
  for_each                                      = var.subnets
  resource_group_name                           = azurerm_resource_group.this[each.value.resource_group_key].name
  virtual_network_name                          = azurerm_virtual_network.this[each.value.vnet_key].name
  name                                          = each.key
  address_prefixes                              = each.value.address_prefixes # list
  private_endpoint_network_policies_enabled     = try(each.value.private_endpoint_network_policies_enabled, true)
  private_link_service_network_policies_enabled = try(each.value.private_link_service_network_policies_enabled, true)
  service_endpoints                             = try(each.value.service_endpoints, null)
  service_endpoint_policy_ids                   = try(each.value.service_endpoint_policy_ids, null)
  #TODO: #1 Add dynamic delegation block
  #TODO: #4 Add service delegation block support

  dynamic "delegation" {
    for_each = each.value.delegation != null ? each.value.delegation : {}
    content {
      name = delegation.key
      service_delegation {
        name    = delegation.key
        actions = delegation.value.actions
      }
    }
  }

  #TODO: #3 Add service endpoint policy id support
}

resource "azurerm_network_security_group" "this" {
  for_each            = var.nsgs
  name                = each.key
  location            = azurerm_resource_group.this[each.value.resource_group_key].location
  resource_group_name = azurerm_resource_group.this[each.value.resource_group_key].name

  dynamic "security_rule" {
    for_each = each.value.security_rules
    content {
      name                       = security_rule.key
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
  tags = merge(var.tags, local.tags)
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each                  = var.nsgs
  subnet_id                 = azurerm_subnet.this[each.value.subnet_key].id
  network_security_group_id = azurerm_network_security_group.this[each.key].id
}

/* resource "azurerm_bastion_host" "this" {
  for_each = var.bastions
  name = each.key
  location            = azurerm_resource_group.this[each.value.resource_group_key].location
  resource_group_name = azurerm_resource_group.this[each.value.resource_group_key].name
  copy_paste_enabled = true
  file_copy_enabled = true
  ip_connect_enabled = true
  tunneling_enabled = true
  sku = "Standard"
  tags = merge(var.tags, local.tags)

  ip_configuration {
    name = ""
    # Must be named AzureBastionSubnet >= /26
    subnet_id = ""
    public_ip_address_id = ""
  }
} */