# TODO: Basic VM Creation
# -- 

resource "azurerm_linux_virtual_machine" "this" {
  for_each            = var.linux_dev_vms
  name                = each.key
  resource_group_name = var.baseinfrastructure.resource_groups[each.value.resource_group_key]
  location            = var.baseinfrastructure.locations[each.value.resource_group_key]
  size                = each.value.size           # "Standard_F2"
  admin_username      = each.value.admin_username # "adminuser"
  network_interface_ids = [
    azurerm_network_interface.this[each.key].id,
  ]

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = try(file(each.value.public_key),file("~/.ssh/id_rsa.pub")) #lookup(each.value, file(public_key), file("~/.ssh/id_rsa.pub")) # != null ? each.value.public_key : file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}