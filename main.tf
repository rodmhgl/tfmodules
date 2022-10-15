module "baseinfrastructure" {
  source           = "./baseinfrastructure"
  resource_groups  = var.resource_groups
  virtual_networks = var.virtual_networks
  subnets          = var.subnets
  nsgs             = var.nsgs
  tags = var.tags
}
