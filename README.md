# azapi-nsgs-demo
Example of using Azure AzAPI TF provider to deploy NSGs across multiple subscriptions, via a single module loop, passing parent id (target subscription and resource group) 'dynamically'.
- Arguably one of the nice features of AzAPI resource blocks is that they are optionally decoupled from the AzureRM provider limitation of scoping code blocks and for_each loops *per subscription*, where deployments need to span multiple subs
- For Azure resource provider REST APIs where a given resource includes a "parent_id" property, which can be passed through at call time, this gets around having to duplicate code blocks per AzureRM provider which might be desirable for higher-scale resource deployments that span many target subscriotions
- Example is NSGs and dependencies which are subscription-specific (scoped per sub)
- Example is not yet complete - need to adapt AzureRM code for deploying ASGs, and NSG=>subnet/NSG=>vNIC association configurations to AzAPI so example is fully self contained for managing all of these at scale with minimal lines of code.
## Constructs
- subs.tf: 
  - reads available subscritions via data source
  - creates a map of subscription display_name => subscription ID/config, enabling lookup of sub id by display name (CAVEAT: useful for demo and testing purposes, *not intended as a pattern for use in production* because subscription display names can easily change!)
  - map is used as lookup when modules are called in main.tf
- ./config
  - holds yaml files defining config for resource group and nsg resources (as a preference to TF vars)
  - yaml files are read using yamldecode in locals.tf
- locals.tf
  - reads yaml config files for resource groups and nsgs and converts to associated TF maps
  - maps are basis for looping through resource instances in main.tf
- main.tf
  - Includes a single module loop calling ./modules/resourcegroup-azapi, creating resource groups across multiple subs (as defined in ./config/resourcegroups.yaml)
  - Includes a single module loop calling ./modules/nsg-azapi, creating NSGs and associated securityRules across multiple subs (as defined in ./config/nsgs.yaml)