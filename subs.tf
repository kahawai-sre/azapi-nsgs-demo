
#// Read available subs
data "azurerm_subscriptions" "available" {
}

#// Get map of subs keyed by sub display name for lookup of id by name
#// NOTE this is convenient for demo and test code, but not suggested for use in production as subscription display names may change.
locals {
  sub_config_map       = { for sub_config in data.azurerm_subscriptions.available.subscriptions : sub_config.display_name => sub_config }
  sub_config_map_subid = { for sub_config in data.azurerm_subscriptions.available.subscriptions : sub_config.subscription_id => sub_config }
}
