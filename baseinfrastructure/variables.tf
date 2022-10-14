variable "tags" {
  type        = map(string)
  description = "Global tags to apply to taggable resources."
}

variable "resource_groups" {
  type = map(object({
    resource_group_name     = string
    resource_group_location = string
    tags                    = map(string)
  }))
  description = "Map of resource groups to create."
}

variable "virtual_networks" {
  type = map(object({
    name               = string
    resource_group_key = string
    address_space      = list(string)
    dns_servers        = optional(list(string))
    tags               = optional(map(string))
  }))
}

variable "subnets" {
  type = map(object({
    name                                          = string
    resource_group_key                            = string
    vnet_key                                      = string
    address_prefixes                              = list(string)
    private_endpoint_network_policies_enabled     = bool
    private_link_service_network_policies_enabled = bool
  }))
  description = "Map of subnets to create."
}
