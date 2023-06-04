

#// 1. Deploy resource groups as per "resourcegroups_config_map" defined in locals.tf
module "resourcegroup-azapi" {
  for_each  = local.resourcegroups_config_map
  source    = "./modules/resourcegroup-azapi/"
  name      = each.value.name
  location  = each.value.location
  parent_id = local.sub_config_map[each.value.sub_name].id
  sub_name  = each.value.sub_name
  tags      = each.value.tags
}

#// TODO:
#// 2. Deploy ASGs as per "asgs_config_map"

#// 3. Deploy NSGs and associated securityRules as per "nsgs_config_map" defined in locals.tf
module "nsg-azapi" {
  for_each        = local.nsgs_config_map
  source          = "./modules/nsg-azapi/"
  name            = each.value.name
  location        = each.value.location
  parent_id       = "${local.sub_config_map[each.value.sub_name].id}/resourceGroups/${each.value.rg_name}"
  flushConnection = each.value.flushConnection
  securityRules   = each.value.securityRules
  tags            = each.value.tags
  depends_on      = [module.resourcegroup-azapi, data.azurerm_subscriptions.available]
}

#// TODO:
#// 4. Deploy NSG=>Subnet associations as per " nsg_subnet_associations_flatten" defined in locals.tf
#// 5. Deploy NSG=>vNIC associations as per " nsg_vNic_associations_flatten" defined in locals.tf
