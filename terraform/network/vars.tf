
# VMware Folder, where VM will be created
variable "ocp-folder" {
  default = "/dc-home/vm/spielwiese"
}

# VMware Tag
variable "master_guest_id_tag" {
  default = "centos8_64Guest"
}

# VMware User
variable "vsphere_user" {
  default = "administrator@home.local"
}

# VMware Pass
variable "vsphere_pass" {
  default = "Test1234!"
}

# VMware Server
variable "vsphere_server" {
  default = "vcenter.home.local"
}

# VM-Name
variable "vm_name" {
  default = "default-vm-name"
}

# VM-CPU
variable "vm_cpu" {
  default = "1"
}
# VM-RAM
variable "vm_ram" {
  default = "1024"
}

# VM-DISK
variable "vm_disk" {
  default = "16"
}

# Boot-Delay
variable "vm_vsphere_vm_boot_delay" {
  default = "0"
}