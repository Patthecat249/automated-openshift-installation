
# VMware Folder, where VM will be created
variable "ocp-folder" {
  default = "{{ dir_vmware }}"
}

# VMware Tag
variable "master_guest_id_tag" {
  default = "centos8_64Guest"
}

# VMware User
variable "vsphere_user" {
  default = "{{ vsphere_user }}"
}

# VMware Pass
variable "vsphere_pass" {
  default = "{{ vsphere_pass }}"
}

# VMware Server
variable "vsphere_server" {
  default = "{{ vsphere_server }}"
}

# VM-Name
variable "vm_name" {
  default = ""
}

# VM-CPU
variable "vm_cpu" {
  default = ""
}
# VM-RAM
variable "vm_ram" {
  default = ""
}

# VM-DISK
variable "vm_disk" {
  default = ""
}

# Boot-Delay
variable "vm_boot_delay" {
  default = ""
}