output "resourcegroup_id" {
  value = jsondecode(azapi_resource.this.output).id
}

output "resourcegroup_name" {
  value = jsondecode(azapi_resource.this.output).name
}

output "resourcegroup_location" {
  value = jsondecode(azapi_resource.this.output).location
}

