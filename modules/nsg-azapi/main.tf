resource "azapi_resource" "this" {
  type      = "Microsoft.Network/networkSecurityGroups@2022-07-01"
  name      = var.name
  location  = var.location
  parent_id = var.parent_id #// Fully qualified Id of the parent Resource Group
  tags      = var.tags
  body = jsonencode({
    properties = {
      flushConnection = var.flushConnection
      securityRules   = var.securityRules
    }
  })
  response_export_values = ["*"]
}