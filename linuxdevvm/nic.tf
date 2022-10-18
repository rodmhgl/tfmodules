locals {
  #  nic_name = 
}

resource "azurerm_network_interface" "this" {
  for_each = var.linux_dev_vms
  #TODO: Add Multiple NIC Support for Linux VMs
  name                = "${each.key}-nic"
  location            = var.baseinfrastructure.locations[each.value.resource_group_key]
  resource_group_name = var.baseinfrastructure.resource_groups[each.value.resource_group_key]

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.baseinfrastructure.subnet_ids[each.value.subnet_key]
    private_ip_address_allocation = "Dynamic"
  }
}