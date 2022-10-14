variable "tags" {
  type        = map(string)
  description = "Global tags to apply to taggable resources."
}

variable "resource_groups" {
  type = map(object({
    /* resource_group_name     = string */
    resource_group_location = string
    tags                    = map(string)
  }))
  description = "Map of resource groups to create."
}

variable "virtual_networks" {
  type = map(object({
    /* name               = string */
    resource_group_key = string
    address_space      = list(string)
    dns_servers        = optional(list(string))
    tags               = optional(map(string))
  }))
}

variable "subnets" {
  type = map(object({
    resource_group_key                            = string
    vnet_key                                      = string
    address_prefixes                              = list(string)
    private_endpoint_network_policies_enabled     = optional(bool)
    private_link_service_network_policies_enabled = optional(bool)
    service_endpoints                             = optional(list(string))
  }))
  description = "Map of subnets to create."
}

variable "nsgs" {
  type = map(object({
    resource_group_key = string
    subnet_key         = string
    security_rules = map(object({
      name                       = string
      priority                   = string
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
  description = "Map of NSGs to create"
}