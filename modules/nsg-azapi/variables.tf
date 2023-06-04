
variable "name" {
}

variable "location" {
}

variable "flushConnection" {
  type    = bool
  default = false
}

variable "parent_id" {

}

variable "securityRules" {
  type    = any
  default = null
}


variable "tags" {
  type    = map(string)
  default = null
}
