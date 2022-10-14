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
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | Map of resource groups to create. | <pre>map(object({<br>    resource_group_name     = string<br>    resource_group_location = string<br>    tags                    = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Map of subnets to create. | <pre>map(object({<br>    name                                          = string<br>    resource_group_key                            = string<br>    vnet_key                                      = string<br>    address_prefixes                              = list(string)<br>    private_endpoint_network_policies_enabled     = bool<br>    private_link_service_network_policies_enabled = bool<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Global tags to apply to taggable resources. | `map(string)` | n/a | yes |
| <a name="input_virtual_networks"></a> [virtual\_networks](#input\_virtual\_networks) | n/a | <pre>map(object({<br>    name               = string<br>    resource_group_key = string<br>    address_space      = list(string)<br>    dns_servers        = optional(list(string))<br>    tags               = optional(map(string))<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
