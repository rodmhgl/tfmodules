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
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nsgs"></a> [nsgs](#input\_nsgs) | Map of NSGs to create | <pre>map(object({<br>    resource_group_key = string<br>    subnet_key         = string<br>    security_rules = map(object({<br>      name                       = string<br>      priority                   = string<br>      direction                  = string<br>      access                     = string<br>      protocol                   = string<br>      source_port_range          = string<br>      destination_port_range     = string<br>      source_address_prefix      = string<br>      destination_address_prefix = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | Map of resource groups to create. | <pre>map(object({<br>    resource_group_location = string<br>  }))</pre> | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Map of subnets to create. | <pre>map(object({<br>    resource_group_key                            = string<br>    vnet_key                                      = string<br>    address_prefixes                              = list(string)<br>    private_endpoint_network_policies_enabled     = optional(bool)<br>    private_link_service_network_policies_enabled = optional(bool)<br>    service_endpoints                             = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Global tags to apply to taggable resources. | `map(string)` | n/a | yes |
| <a name="input_virtual_networks"></a> [virtual\_networks](#input\_virtual\_networks) | n/a | <pre>map(object({<br>    resource_group_key = string<br>    address_space      = list(string)<br>    dns_servers        = optional(list(string))<br>    tags               = optional(map(string))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_groups"></a> [resource\_groups](#output\_resource\_groups) | n/a |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | n/a |
| <a name="output_vnet_ids"></a> [vnet\_ids](#output\_vnet\_ids) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
