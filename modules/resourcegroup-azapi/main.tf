
resource "azapi_resource" "this" {
  type                   = "Microsoft.Resources/resourceGroups@2022-09-01"
  name                   = var.name
  location               = var.location
  parent_id              = var.parent_id
  tags                   = var.tags
  response_export_values = ["*"]
}

#firewall_policy_id              = module.azurefirewallchildpolicy-security[each.value.firewall_policy_name].firewallpolicy_id
#https://stackoverflow.com/questions/59081428/how-to-reference-a-data-source-from-a-module-to-another-module-and-pass-it-as-a
