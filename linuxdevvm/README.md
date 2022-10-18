# linuxdevvm

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.26.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_baseinfrastructure"></a> [baseinfrastructure](#input\_baseinfrastructure) | n/a | <pre>object({<br>    locations       = map(string)<br>    resource_groups = map(string)<br>    subnet_ids      = map(string)<br>    vnet_ids        = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_linux_dev_vms"></a> [linux\_dev\_vms](#input\_linux\_dev\_vms) | n/a | <pre>map(object({<br>    admin_username     = string<br>    size               = string<br>    resource_group_key = string<br>    subnet_key         = string<br>    public_key         = optional(string)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
