# vcenter-connection
variable "vsphere_server" {
  default = "vcenter.home.local"
}

variable "vsphere_user" {
  default = "administrator@home.local"
}

variable "vsphere_password" {
  default = "Test1234!"
}

# VM-name
variable "vm_name" {
  default = "test-vm"
}

variable "cpu" {
  default = "1"
}

variable "ram" {
  default = "1024"
}

variable "vm_folder" {
  default = "spielwiese"
}

variable "guest_id_tag" {
  default = "centos7_64Guest"
}

# vcenter-objects
variable "vsphere_datacenter" {
  default = "dc-home"
}

variable "vsphere_compute_cluster" {
  default = "cluster-home"
}

variable "vsphere_resource_pool" {
  default = "rp-home"
}

variable "vsphere_datastore" {
  default = "openshift_storage"
}

variable "vsphere_network" {
  default = "dpg-home-prod"
}
