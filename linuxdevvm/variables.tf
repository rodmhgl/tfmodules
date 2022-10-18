variable "linux_dev_vms" {
  type = map(object({
    admin_username     = string
    size               = string
    resource_group_key = string
    subnet_key         = string
    public_key         = optional(string)
  }))
}

variable "baseinfrastructure" {
  type = object({
    locations       = map(string)
    resource_groups = map(string)
    subnet_ids      = map(string)
    vnet_ids        = map(string)
  })
}