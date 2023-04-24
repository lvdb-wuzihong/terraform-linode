variable "LINODE_TOKEN" {
  type = string
  sensitive = false
}
variable "instance_label" {
  type = string
  description = "instance name"
}
variable "image" {
  type = string
  description = "image types"
}
variable "region" {
  type = string
  description = "region"
}
variable "instance_type" {
  type = string
}
variable "authorized_keys" {
  type = list(string)
  description = "list for ssh_key,could not use file('/root/.ssh/id_rsa.pub')"
}
variable "password" {
  type = string
  description = "instance password, the length must longer than 15"
}
variable "config_label" {
  type = string
  description = "config name"
}
variable "private_address" {
  type = string
  description = "network address for private network"
}
variable "num_of_instance" {
  type = number
}
