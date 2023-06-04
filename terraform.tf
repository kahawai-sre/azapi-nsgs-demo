terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
    }
  }
}

provider "azapi" {
}

#// AzureRM is only used here for looking up subs via data source in 'subs.tf'. Could be updated to remove this.
provider "azurerm" {
  features {}
}
