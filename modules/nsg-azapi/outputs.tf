
output "nsg_id" {
  value = jsondecode(azapi_resource.this.output).id
}

output "nsg_name" {
  value = jsondecode(azapi_resource.this.output).name
}

output "nsg_location" {
  value = jsondecode(azapi_resource.this.output).location
}
