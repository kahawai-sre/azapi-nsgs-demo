

variable "name" {
  description = "Name of the resourcegroup to create"
}

variable "location" {
  default = "australiaeast"
}

variable "parent_id" {
}

variable "sub_name" {
}

variable "tags" {
  type    = map(string)
  default = null
}
