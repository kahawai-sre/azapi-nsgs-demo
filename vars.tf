

#// Path to yaml file defining Resource Groups to deploy and manage
variable "resourcegroups_yaml_file_path" {
  default = "./config/resourcegroups.yaml"
}

#// Path to yaml file defining NSGs and associated securityRules to deploy and manage
variable "nsgs_yaml_file_path" {
  default = "./config/nsgs.yaml"
}


